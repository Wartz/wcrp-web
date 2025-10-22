<#
Helper script to build and run the site locally using docker-compose on Windows PowerShell.
Usage: ./scripts/run-local.ps1 [up|down|restart]
#>
param(
    [string]$Action = 'up'
)

$composeFile = Join-Path -Path $PSScriptRoot -Parent | Join-Path -ChildPath '..\docker-compose.yml'
Write-Output "Using docker-compose file at: $composeFile"

switch ($Action.ToLower()) {
    'up' {
        docker-compose -f $composeFile up --build
        break
    }
    'down' {
        docker-compose -f $composeFile down
        break
    }
    'restart' {
        docker-compose -f $composeFile down
        docker-compose -f $composeFile up --build
        break
    }
    default {
        Write-Output "Unknown action: $Action. Use up|down|restart"
    }
}
