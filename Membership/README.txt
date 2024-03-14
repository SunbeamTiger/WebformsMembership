
Cloning a Webforms proj may result in an erro the first time you run.
That's becasue GitGub routinely strips off binarires, storing only code
(text) files. As a result, you need to restore the necessary binaries
before running
To to that, in VS go to Tools > NuGet Package Manager > Package Manager Console
and paste in the following to the command window:
Update-Package Microsoft.CodeDom.Providers.DotNetCompilerPlatform -r

The binaries should update immediately and the app should run

