'this test uses the DownloadResource method of the WebElement class to download the src to an img element

'Use late-bound CreateObject to instantiate a new SeleniumVBA object
Set driver = CreateObject("SeleniumVBA.WebDriver")

driver.StartChrome
driver.OpenBrowser
    
driver.NavigateTo "https://github.com/GCuser99/SeleniumVBA/wiki"
driver.Wait 1000

'VBScript does not support Enums so cannot use the By enumerator.
'Set element = driver.FindElement(By.cssSelector, "img[alt='SeleniumVBA'")

'There are several work-arounds for above but the easiest fix is to replace with its alternative method:
Set element = driver.FindElementByCssSelector("img[alt='SeleniumVBA'")

'VBScript does not recognize the Named Argument syntax (":=") of passing argument values
'element.DownloadResource srcAttribute:="src", fileOrFolderPath:=".\"

'So must pass argument values the other way:
'element.DownloadResource "src", ".\"

'BUT, use of relative path like ".\" will end up pointing to the DLL library folder, not the folder containing the script...

'So if that is not the desired behavior, then best practice is to use absolute paths like below:
element.DownloadResource "src", "%USERPROFILE%\Downloads\"
    
driver.CloseBrowser
driver.Shutdown