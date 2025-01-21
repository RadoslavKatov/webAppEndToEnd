# Azure SQL Server
resource "azurerm_mssql_server" "webapp-ete-sql-server" {
  name                         = "webappsqlserver"
  resource_group_name          = azurerm_resource_group.webapp-ete-rg.name
  location                     = azurerm_resource_group.webapp-ete-rg.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "StrongPassword123!"  # Replace with a secure password
}

# Azure SQL Database
resource "azurerm_mssql_database" "webapp-ete-sql-db" {
  name                = "tasks_db"
  server_id           = azurerm_mssql_server.webapp-ete-sql-server.id
  sku_name            = "S0"
}