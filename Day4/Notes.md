# Notes for Day4

## Theme: **MITRE ATT&CK framework / detection and alerting**

## Links

- [Atomic Red Team](https://github.com/redcanaryco/atomic-red-team)
- [Intro to Atomic Red Team on Windows](https://medium.com/@renbe/atomic-red-team-on-windows-7f07b8561b8)
- [Mitre Attack Framework](https://attack.mitre.org/)
- [Mitre Attack Navigator](https://mitre-attack.github.io/attack-navigator/)

## General

- Invoke-AtomicTest Parameters:
  
| Parameter          | Explanation                                                             | Example Use                                                                                  |
|--------------------|-------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| -Atomic Technique  | Defines the technique to emulate. Can use the full name or "TXXXX".    | `Invoke-AtomicTest -AtomicTechnique T1566.001`                                             |
| -ShowDetails       | Displays details of each test included in the Atomic.                  | `Invoke-AtomicTest T1566.001 -ShowDetails`                                                 |
| -ShowDetailsBrief  | Displays the title of each test included in the Atomic.                | `Invoke-AtomicTest T1566.001 -ShowDetailsBrief`                                            |
| -CheckPrereqs      | Checks if all necessary components are present for testing.            | `Invoke-AtomicTest T1566.001 -CheckPrereqs`                                                |
| -TestNames         | Executes tests by specifying their complete Atomic Test Name.          | `Invoke-AtomicTest T1566.001 -TestNames "Download Macro-Enabled Phishing Attachment"`      |
| -TestGuids         | Executes tests by specifying their unique test identifier.             | `Invoke-AtomicTest T1566.001 -TestGuids 114ccff9-ae6d-4547-9ead-4cd69f687306`             |
| -TestNumbers       | Executes tests by specifying the test number within the Atomic Technique. | `Invoke-AtomicTest T1566.001 -TestNumbers 2,3`                                            |
| -Cleanup           | Runs cleanup commands to revert the machine state to normal.           | `Invoke-AtomicTest T1566.001 -TestNumbers 2 -Cleanup`                                      |

- Sample test information:

|
| Key                  | Value                                                                                                           | Description                                                                                                                                                        |
|----------------------|-----------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Technique**        | Phishing: Spearphishing Attachment T1566.001                                                                  | The full name of the MITRE ATT&CK technique that will be tested.                                                                                                  |
| **Atomic Test Name** | Download Macro-Enabled Phishing Attachment                                                                     | A descriptive name of the type of test that will be executed.                                                                                                    |
| **Atomic Test Number** | 1                                                                                                             | A number assigned to the test, which can be used in commands to specify the test to run.                                                                          |
| **Atomic Test GUID** | 114ccff9-ae6d-4547-9ead-4cd69f687306                                                                           | A unique ID assigned to the test, which can be used in commands to specify the test to run.                                                                       |
| **Description**      | This atomic test downloads a macro-enabled document from the Atomic Red Team GitHub repository, simulating an end-user clicking a phishing link to download the file. The file "PhishingAttachment.xlsm" is downloaded to the `%temp%` directory. | Provides a detailed explanation of what the test will do.                                                                                                        |
| **Attack Commands**  | **Executor:** PowerShell<br>**ElevationRequired:** False<br>**Command:** `$url = ‘http://localhost/PhishingAttachment.xlsm’; Invoke-WebRequest -Uri $url -OutFile $env:TEMP.xlsm` | Provides an overview of commands executed during the test, including the executor, required privileges, and potential areas to investigate for artifacts.         |
| **Cleanup Commands** | `Command: Remove-Item $env:TEMP.xlsm -ErrorAction Ignore`                                                     | Commands executed to revert the machine to its original state.                                                                                                   |
| **Dependencies**     | There are no dependencies required.                                                                           | An overview of resources that must be present on the testing machine to execute the test.                                                                         |
