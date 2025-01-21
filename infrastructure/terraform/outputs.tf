output "vm_public_ip" {
  value = azurerm_public_ip.webapp-ete-puip.ip_address
  description = "Public IP address of the Virtual Machine"
}

# SQL Server Name
output "sql_server_name" {
  value = azurerm_mssql_server.webapp-ete-sql-server.name
  description = "Azure SQL Server Name"
}

# SQL Database Name
output "sql_database_name" {
  value = azurerm_mssql_database.webapp-ete-sql-db.name
  description = "Azure SQL Database Name"
}