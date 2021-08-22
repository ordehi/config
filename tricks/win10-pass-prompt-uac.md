# Require Admin Password/PIN on UAC prompt

This is a good way to protect your PC from running admin tasks unless you enter your password/PIN. This is mostly useful if you share your PC, want to avoid USB Rubber Ducky and the likes from doing damage, or are generally paranoid.

For an automated edit, run _pass-prompt-uac.reg_.
Remember to always read scripts before executing them. 😊

Manual edit:

1. Open the Registry Editor
   Easiest way is _Win + R_ then type _regedit_ and hit _Enter_
2. Go to _Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System_
3. Change _ConsentPromptBehaviorAdmin_ from a value of 5 to a value of 1

For more information on how to edit the Windows Registry, check the docs: https://support.microsoft.com/en-us/topic/how-to-add-modify-or-delete-registry-subkeys-and-values-by-using-a-reg-file-9c7f37cf-a5e9-e1cd-c4fa-2a26218a1a23#bkmk_syntax

(click here)[https://support.microsoft.com/en-us/topic/how-to-add-modify-or-delete-registry-subkeys-and-values-by-using-a-reg-file-9c7f37cf-a5e9-e1cd-c4fa-2a26218a1a23]
