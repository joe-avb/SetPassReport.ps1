import-module activedirectory
get-aduser -filter * -properties passwordlastset, EmailAddress, enabled | Where { $_.Enabled -eq $True } | 
select name, EmailAddress, passwordlastset  | 
Sort-Object -Property passwordlastset |
export-csv "Path\To\Pass_last_set_$(get-date -f yyyy-MM-dd-hhmm).csv"