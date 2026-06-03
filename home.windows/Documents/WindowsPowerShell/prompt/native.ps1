function prompt {
    "`n> ${env:UserName} @ ${env:ComputerName} [$(Get-Date -UFormat '--%m-%d %H:%M:%S %Z')]" `
    + "`n- $($ExecutionContext.SessionState.Path.CurrentLocation)" `
    + "`n" + $(if ((New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) { "# " } else { "$ " })
}
