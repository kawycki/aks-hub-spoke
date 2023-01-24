locals {
  fw_name = "hub-fw"
}
resource "azurerm_resource_group" "sandbox_rg" {
  location = "westeurope"
  name     = "sandbox"
}

# resource "azurerm_log_analytics_workspace" "res-55" {
#   location            = "westeurope"
#   name                = "la-hub-westeurope-gylvm7nawowpw"
#   resource_group_name = "sandbox"
#   depends_on = [
#     azurerm_resource_group.res-0,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-59" {
#   category                   = "General Exploration"
#   display_name               = "Distribution of data Types"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_General|dataTypeDistribution"
#   query                      = "search * | extend Type = $table | summarize AggregatedValue = count() by Type\r\n// Oql: * | Measure count() by Type // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-57" {
#   category                   = "General Exploration"
#   display_name               = "Stale Computers (data older than 24 hours)"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_General|StaleComputers"
#   query                      = "search not(ObjectName == \"Advisor Metrics\" or ObjectName == \"ManagedSpace\") | summarize lastdata = max(TimeGenerated) by Computer | limit 500000 | where lastdata < ago(24h)\r\n// Oql: NOT(ObjectName=\"Advisor Metrics\" OR ObjectName=ManagedSpace) | measure max(TimeGenerated) as lastdata by Computer | top 500000 | where lastdata < NOW-24HOURS // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-56" {
#   category                   = "General Exploration"
#   display_name               = "All Computers with their most recent data"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_General|AlphabeticallySortedComputers"
#   query                      = "search not(ObjectName == \"Advisor Metrics\" or ObjectName == \"ManagedSpace\") | summarize AggregatedValue = max(TimeGenerated) by Computer | limit 500000 | sort by Computer asc\r\n// Oql: NOT(ObjectName=\"Advisor Metrics\" OR ObjectName=ManagedSpace) | measure max(TimeGenerated) by Computer | top 500000 | Sort Computer // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-58" {
#   category                   = "General Exploration"
#   display_name               = "Which Management Group is generating the most data points?"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_General|dataPointsPerManagementGroup"
#   query                      = "search * | summarize AggregatedValue = count() by ManagementGroupName\r\n// Oql: * | Measure count() by ManagementGroupName // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-62" {
#   category                   = "Log Management"
#   display_name               = "All Syslog Records grouped by Facility"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|AllSyslogByFacility"
#   query                      = "Syslog | summarize AggregatedValue = count() by Facility\r\n// Oql: Type=Syslog | Measure count() by Facility // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-63" {
#   category                   = "Log Management"
#   display_name               = "All Syslog Records grouped by ProcessName"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|AllSyslogByProcessName"
#   query                      = "Syslog | summarize AggregatedValue = count() by ProcessName\r\n// Oql: Type=Syslog | Measure count() by ProcessName // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-61" {
#   category                   = "Log Management"
#   display_name               = "All Syslogs"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|AllSyslog"
#   query                      = "Syslog | sort by TimeGenerated desc\r\n// Oql: Type=Syslog // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-60" {
#   category                   = "Log Management"
#   display_name               = "All Events"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|AllEvents"
#   query                      = "Event | sort by TimeGenerated desc\r\n// Oql: Type=Event // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-66" {
#   category                   = "Log Management"
#   display_name               = "Average HTTP Request time by HTTP Method"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|AverageHTTPRequestTimeHTTPMethod"
#   query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = avg(TimeTaken) by csMethod\r\n// Oql: Type=W3CIISLog | Measure Avg(TimeTaken) by csMethod // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-67" {
#   category                   = "Log Management"
#   display_name               = "Count of IIS Log Entries by Client IP Address"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|CountIISLogEntriesClientIPAddress"
#   query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by cIP\r\n// Oql: Type=W3CIISLog | Measure count() by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-69" {
#   category                   = "Log Management"
#   display_name               = "Count of IIS Log Entries by HTTP User Agent"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|CountIISLogEntriesHTTPUserAgent"
#   query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUserAgent\r\n// Oql: Type=W3CIISLog | Measure count() by csUserAgent // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-68" {
#   category                   = "Log Management"
#   display_name               = "Count of IIS Log Entries by HTTP Request Method"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|CountIISLogEntriesHTTPRequestMethod"
#   query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csMethod\r\n// Oql: Type=W3CIISLog | Measure count() by csMethod // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-65" {
#   category                   = "Log Management"
#   display_name               = "Average HTTP Request time by Client IP Address"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|AverageHTTPRequestTimeByClientIPAddress"
#   query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = avg(TimeTaken) by cIP\r\n// Oql: Type=W3CIISLog | Measure Avg(TimeTaken) by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-64" {
#   category                   = "Log Management"
#   display_name               = "All Syslog Records with Errors"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|AllSyslogsWithErrors"
#   query                      = "Syslog | where SeverityLevel == \"error\" | sort by TimeGenerated desc\r\n// Oql: Type=Syslog SeverityLevel=error // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-73" {
#   category                   = "Log Management"
#   display_name               = "Count of Events with level \"Warning\" grouped by Event ID"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|CountOfWarningEvents"
#   query                      = "Event | where EventLevelName == \"warning\" | summarize AggregatedValue = count() by EventID\r\n// Oql: Type=Event EventLevelName=warning | Measure count() by EventID // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-70" {
#   category                   = "Log Management"
#   display_name               = "Count of IIS Log Entries by Host requested by client"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|CountOfIISLogEntriesByHostRequestedByClient"
#   query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csHost\r\n// Oql: Type=W3CIISLog | Measure count() by csHost // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-71" {
#   category                   = "Log Management"
#   display_name               = "Count of IIS Log Entries by URL for the host \"www.contoso.com\" (replace with your own)"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|CountOfIISLogEntriesByURLForHost"
#   query                      = "search csHost == \"www.contoso.com\" | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUriStem\r\n// Oql: Type=W3CIISLog csHost=\"www.contoso.com\" | Measure count() by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-72" {
#   category                   = "Log Management"
#   display_name               = "Count of IIS Log Entries by URL requested by client (without query strings)"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|CountOfIISLogEntriesByURLRequestedByClient"
#   query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUriStem\r\n// Oql: Type=W3CIISLog | Measure count() by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-77" {
#   category                   = "Log Management"
#   display_name               = "Count of Events grouped by Event ID"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|EventsByEventsID"
#   query                      = "Event | summarize AggregatedValue = count() by EventID\r\n// Oql: Type=Event | Measure count() by EventID // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-78" {
#   category                   = "Log Management"
#   display_name               = "Events in the Operations Manager Event Log whose Event ID is in the range between 2000 and 3000"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|EventsInOMBetween2000to3000"
#   query                      = "Event | where EventLog == \"Operations Manager\" and EventID >= 2000 and EventID <= 3000 | sort by TimeGenerated desc\r\n// Oql: Type=Event EventLog=\"Operations Manager\" EventID:[2000..3000] // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-75" {
#   category                   = "Log Management"
#   display_name               = "Count of Events grouped by Event Log"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|EventsByEventLog"
#   query                      = "Event | summarize AggregatedValue = count() by EventLog\r\n// Oql: Type=Event | Measure count() by EventLog // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-76" {
#   category                   = "Log Management"
#   display_name               = "Count of Events grouped by Event Source"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|EventsByEventSource"
#   query                      = "Event | summarize AggregatedValue = count() by Source\r\n// Oql: Type=Event | Measure count() by Source // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-74" {
#   category                   = "Log Management"
#   display_name               = "Shows breakdown of response codes"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|DisplayBreakdownRespondCodes"
#   query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by scStatus\r\n// Oql: Type=W3CIISLog | Measure count() by scStatus // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-79" {
#   category                   = "Log Management"
#   display_name               = "Count of Events containing the word \"started\" grouped by EventID"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|EventsWithStartedinEventID"
#   query                      = "search in (Event) \"started\" | summarize AggregatedValue = count() by EventID\r\n// Oql: Type=Event \"started\" | Measure count() by EventID // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-81" {
#   category                   = "Log Management"
#   display_name               = "IIS Log Entries for a specific client IP Address (replace with your own)"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|IISLogEntriesForClientIP"
#   query                      = "search cIP == \"192.168.0.1\" | extend Type = $table | where Type == W3CIISLog | sort by TimeGenerated desc | project csUriStem, scBytes, csBytes, TimeTaken, scStatus\r\n// Oql: Type=W3CIISLog cIP=\"192.168.0.1\" | Select csUriStem,scBytes,csBytes,TimeTaken,scStatus // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-80" {
#   category                   = "Log Management"
#   display_name               = "Find the maximum time taken for each page"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|FindMaximumTimeTakenForEachPage"
#   query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = max(TimeTaken) by csUriStem\r\n// Oql: Type=W3CIISLog | Measure Max(TimeTaken) by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-83" {
#   category                   = "Log Management"
#   display_name               = "How many connections to Operations Manager's SDK service by day"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|NoOfConnectionsToOMSDKService"
#   query                      = "Event | where EventID == 26328 and EventLog == \"Operations Manager\" | summarize AggregatedValue = count() by bin(TimeGenerated, 1d) | sort by TimeGenerated desc\r\n// Oql: Type=Event EventID=26328 EventLog=\"Operations Manager\" | Measure count() interval 1DAY // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-82" {
#   category                   = "Log Management"
#   display_name               = "All IIS Log Entries"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|ListAllIISLogEntries"
#   query                      = "search * | extend Type = $table | where Type == W3CIISLog | sort by TimeGenerated desc\r\n// Oql: Type=W3CIISLog // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-84" {
#   category                   = "Log Management"
#   display_name               = "When did my servers initiate restart?"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|ServerRestartTime"
#   query                      = "search in (Event) \"shutdown\" and EventLog == \"System\" and Source == \"User32\" and EventID == 1074 | sort by TimeGenerated desc | project TimeGenerated, Computer\r\n// Oql: shutdown Type=Event EventLog=System Source=User32 EventID=1074 | Select TimeGenerated,Computer // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-86" {
#   category                   = "Log Management"
#   display_name               = "Shows servers that are throwing internal server error"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|ShowServersThrowingInternalServerError"
#   query                      = "search scStatus == 500 | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by sComputerName\r\n// Oql: Type=W3CIISLog scStatus=500 | Measure count() by sComputerName // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-87" {
#   category                   = "Log Management"
#   display_name               = "Total Bytes received by each Azure Role Instance"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|TotalBytesReceivedByEachAzureRoleInstance"
#   query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(csBytes) by RoleInstance\r\n// Oql: Type=W3CIISLog | Measure Sum(csBytes) by RoleInstance // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-85" {
#   category                   = "Log Management"
#   display_name               = "Shows which pages people are getting a 404 for"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|Show404PagesList"
#   query                      = "search scStatus == 404 | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUriStem\r\n// Oql: Type=W3CIISLog scStatus=404 | Measure count() by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-88" {
#   category                   = "Log Management"
#   display_name               = "Total Bytes received by each IIS Computer"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|TotalBytesReceivedByEachIISComputer"
#   query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(csBytes) by Computer | limit 500000\r\n// Oql: Type=W3CIISLog | Measure Sum(csBytes) by Computer | top 500000 // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-89" {
#   category                   = "Log Management"
#   display_name               = "Total Bytes responded back to clients by Client IP Address"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|TotalBytesRespondedToClientsByClientIPAddress"
#   query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(scBytes) by cIP\r\n// Oql: Type=W3CIISLog | Measure Sum(scBytes) by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-90" {
#   category                   = "Log Management"
#   display_name               = "Total Bytes responded back to clients by each IIS ServerIP Address"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|TotalBytesRespondedToClientsByEachIISServerIPAddress"
#   query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(scBytes) by sIP\r\n// Oql: Type=W3CIISLog | Measure Sum(scBytes) by sIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-92" {
#   category                   = "Log Management"
#   display_name               = "All Events with level \"Warning\""
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|WarningEvents"
#   query                      = "Event | where EventLevelName == \"warning\" | sort by TimeGenerated desc\r\n// Oql: Type=Event EventLevelName=warning // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-91" {
#   category                   = "Log Management"
#   display_name               = "Total Bytes sent by Client IP Address"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|TotalBytesSentByClientIPAddress"
#   query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(csBytes) by cIP\r\n// Oql: Type=W3CIISLog | Measure Sum(csBytes) by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-93" {
#   category                   = "Log Management"
#   display_name               = "Windows Firewall Policy settings have changed"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|WindowsFireawallPolicySettingsChanged"
#   query                      = "Event | where EventLog == \"Microsoft-Windows-Windows Firewall With Advanced Security/Firewall\" and EventID == 2008 | sort by TimeGenerated desc\r\n// Oql: Type=Event EventLog=\"Microsoft-Windows-Windows Firewall With Advanced Security/Firewall\" EventID=2008 // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
# resource "azurerm_log_analytics_saved_search" "res-94" {
#   category                   = "Log Management"
#   display_name               = "On which machines and how many times have Windows Firewall Policy settings changed"
#   log_analytics_workspace_id = "/subscriptions/f353924e-cf6f-4730-9675-ceb9fdd7f9a4/resourceGroups/sandbox/providers/Microsoft.OperationalInsights/workspaces/la-hub-westeurope-gylvm7nawowpw"
#   name                       = "LogManagement(la-hub-westeurope-gylvm7nawowpw)_LogManagement|WindowsFireawallPolicySettingsChangedByMachines"
#   query                      = "Event | where EventLog == \"Microsoft-Windows-Windows Firewall With Advanced Security/Firewall\" and EventID == 2008 | summarize AggregatedValue = count() by Computer | limit 500000\r\n// Oql: Type=Event EventLog=\"Microsoft-Windows-Windows Firewall With Advanced Security/Firewall\" EventID=2008 | measure count() by Computer | top 500000 // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
#   depends_on = [
#     azurerm_log_analytics_workspace.res-55,
#   ]
# }
