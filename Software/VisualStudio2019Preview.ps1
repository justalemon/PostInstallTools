# Visual Studio 2019 Preview
# An IDE for C#, C++ and others by Microsoft

$arguments = @{
    Name = "Visual Studio 2019 Preview"
    Uri = "https://download.visualstudio.microsoft.com/download/pr/4a9a7767-a64a-4ae4-aa89-76bf9daa7396/5237aa20f27d5c218450d52eb64db00772de424479ee177bcf78a4608d3db224/vs_Community.exe"
    Arguments = "--quiet","--norestart",
        "--add","Microsoft.VisualStudio.Workload.CoreEditor", # IDE Basics
        "--add","Microsoft.VisualStudio.Workload.ManagedDesktop", # .NET desktop development
        "--add","Microsoft.Net.ComponentGroup.4.6.1.DeveloperTools", # .NET Framework 4.6.1 development tools
        "--add","Microsoft.Net.ComponentGroup.4.6.2.DeveloperTools", # .NET Framework 4.6.2 development tools
        "--add","Microsoft.Net.ComponentGroup.4.7.1.DeveloperTools", # .NET Framework 4.7.1 development tools
        "--add","Microsoft.Net.ComponentGroup.4.7.DeveloperTools", # .NET Framework 4.7 development tools
        "--add","Microsoft.Net.ComponentGroup.4.8.DeveloperTools", # .NET Framework 4.8 development tools
        "--add","Microsoft.VisualStudio.Component.DiagnosticTools", # .NET profiling tools
        "--add","Microsoft.Net.ComponentGroup.TargetingPacks.Common", # .NET Framework 4 - 4.6 development tools
        "--add","Microsoft.VisualStudio.Component.Debugger.JustInTime" # Just-In-Time debugger
}
Start-Installation @arguments
