FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

WORKDIR /src
COPY . .

# Restaura las dependencias y compila la aplicación
RUN dotnet restore
RUN dotnet build -c Release -o /app/build

# Publica la aplicación
FROM build AS publish
RUN dotnet publish -c Release -o /app/publish

# Configura la imagen final con la aplicación publicada
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "ChatHub.dll"]