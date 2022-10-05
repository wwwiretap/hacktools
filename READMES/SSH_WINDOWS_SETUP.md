//////////////Use Native SSH Client
Check that the SSH client is installed:
Get-WindowsCapability -Online | ? Name -like 'OpenSSH.Client*'
------------------------
If not (State: Not Present), you can install it using:
* The PowerShell command: Add-WindowsCapability -Online -Name OpenSSH.Client*
* With DISM: dism /Online /Add-Capability /CapabilityName:OpenSSH.Server~~~~0.0.1.0
* Via Settings -> Apps -> Optional features -> Add a feature. Find OpenSSH client in the list and click Install.
------------------------
Then the host key fingerprint is added to the C:\Users\username\.ssh\known_hosts file.
------------------------
OpenSSH binary files are located in c:\Windows\System32\OpenSSH\.

    ssh.exe – the SSH client executable;
    scp.exe – tool for copying files in an SSH session;
    ssh-keygen.exe – tool to generate RSA SSH authentication keys;
    ssh-agent.exe – used to manage RSA keys;
    ssh-add.exe – adds a key to the SSH agent database.
------------------------

