# AssetBooking API — ASP.NET Core Backend

A lightweight REST API for booking shared company equipment and preventing double-bookings.

## Features
- Health-check endpoint
- Filter assets by type and availability
- Create bookings with date-overlap validation
- Detect unavailable assets and return useful HTTP status codes
- Cancel bookings
- Swagger API documentation
- In-memory collections, so no database setup is required

## Run locally

```powershell
dotnet run
```

Open the Swagger URL shown in the terminal, usually `/swagger`.

## Technologies
C#, .NET 8, ASP.NET Core Minimal APIs, Swagger/OpenAPI
