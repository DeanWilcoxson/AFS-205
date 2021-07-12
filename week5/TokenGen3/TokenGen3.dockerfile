FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /src
COPY ["TokenGen3.csproj", "TokenGen3/"]
RUN dotnet restore "TokenGen3/TokenGen3.csproj"
COPY . .
WORKDIR "/"
RUN dotnet build "TokenGen3.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "TokenGen3.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "TokenGen3.dll"]
