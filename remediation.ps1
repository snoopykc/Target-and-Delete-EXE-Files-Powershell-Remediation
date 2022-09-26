$p=get-childitem -path C:\Users\$env:USERNAME -Filter filenamehere* -Recurse
if($p -ne $null){
    $owner=Get-ACL -Path $p.FullName
    $output = "$env:COMPUTERNAME Path: $($p.FullName) FileOwner: $($owner.Owner)"
    Write-Output "$env:COMPUTERNAME Path: $($p.FullName) FileOwner: $($owner.Owner)"
    del $($p.FullName)
}

$testRemovable=Test-Path D:\
if($testRemovable -eq $true){
    $d=get-childitem -path D:\ -Filter filenamehere* -Recurse
        if($d -ne $null){
        $owner=Get-ACL -Path $d.FullName
        $output = "$env:COMPUTERNAME Path: $($d.FullName) FileOwner: $($owner.Owner)"
        Write-Output "$env:COMPUTERNAME Path: $($d.FullName) FileOwner: $($owner.Owner)"
        del $($d.FullName)
        }
}


Exit 0
