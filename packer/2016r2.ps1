#region SecurityHardening

#Empty Keys
$key = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\CipherSuites"

foreach($k in $key){
            If  ( -Not ( Test-Path "Registry::$k")){New-Item -Path "Registry::$k" -ItemType RegistryKey -Force}
        }

#SCHANNEL Logging 
$key = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL"

foreach($k in $key){
            If  ( -Not ( Test-Path "Registry::$k")){New-Item -Path "Registry::$k" -ItemType RegistryKey -Force}
            Set-ItemProperty -path "Registry::$k" -Name "EventLogging" -Type "DWord" -Value "00000001"
        }

#Hashes 
$key =  "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\MD5",
        "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\SHA",
        "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\SHA256"

foreach($k in $key){
            If  ( -Not ( Test-Path "Registry::$k")){New-Item -Path "Registry::$k" -ItemType RegistryKey -Force}
            Set-ItemProperty -path "Registry::$k" -Name "Enabled" -Type "DWord" -Value "00000000"
        }


$key =  "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\SHA384"

foreach($k in $key){
            If  ( -Not ( Test-Path "Registry::$k")){New-Item -Path "Registry::$k" -ItemType RegistryKey -Force}
            Set-ItemProperty -path "Registry::$k" -Name "Enabled" -Type "DWord" -Value "0xffffffff"
        }

$key =  "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\SHA512"

foreach($k in $key){
                If  ( -Not ( Test-Path "Registry::$k")){New-Item -Path "Registry::$k" -ItemType RegistryKey -Force}
                Set-ItemProperty -path "Registry::$k" -Name "Enabled" -Type "DWord" -Value "0xffffffff"
        }

#KeyExchangeAlgorithms 
$key =  "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\KeyExchangeAlgorithms\Diffie-Hellman"

foreach($k in $key){
            If  ( -Not ( Test-Path "Registry::$k")){New-Item -Path "Registry::$k" -ItemType RegistryKey -Force}
            Set-ItemProperty -path "Registry::$k" -Name "ServerMinKeyBitLength" -Type "DWord" -Value "00000800"
        }                

$key =  "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\KeyExchangeAlgorithms\PKCS"

foreach($k in $key){
            If  ( -Not ( Test-Path "Registry::$k")){New-Item -Path "Registry::$k" -ItemType RegistryKey -Force}
            Set-ItemProperty -path "Registry::$k" -Name "Enabled" -Type "DWord" -Value "00000000"
        }

$key =  "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\KeyExchangeAlgorithms\ECDH"

foreach($k in $key){
            If  ( -Not ( Test-Path "Registry::$k")){New-Item -Path "Registry::$k" -ItemType RegistryKey -Force}
            Set-ItemProperty -path "Registry::$k" -Name "Enabled" -Type "DWord" -Value "0xffffffff"
        }

#Multi-Protocol Unified Hello 
$key = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\Multi-Protocol Unified Hello\Client",
       "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\Multi-Protocol Unified Hello\Server"

foreach($k in $key){
            If  ( -Not ( Test-Path "Registry::$k")){New-Item -Path "Registry::$k" -ItemType RegistryKey -Force}
            Set-ItemProperty -path "Registry::$k" -Name "Enabled" -Type "DWord" -Value "00000000"
            Set-ItemProperty -path "Registry::$k" -Name "DisabledByDefault" -Type "DWord" -Value "00000001"
        }

#PCT
$key = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\PCT 1.0\Client",
       "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\PCT 1.0\Server"

foreach($k in $key){
            If  ( -Not ( Test-Path "Registry::$k")){New-Item -Path "Registry::$k" -ItemType RegistryKey -Force}
            Set-ItemProperty -path "Registry::$k" -Name "Enabled" -Type "DWord" -Value "00000000"
            Set-ItemProperty -path "Registry::$k" -Name "DisabledByDefault" -Type "DWord" -Value "00000001"
        }


#SSL & TLS Keys
$key =  "HKey_Local_Machine\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Server",
        "HKey_Local_Machine\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Server",
        "HKey_Local_Machine\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server",
        "HKey_Local_Machine\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server",
        "HKey_Local_Machine\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 3.0\Client",
        "HKey_Local_Machine\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL 2.0\Client",
        "HKey_Local_Machine\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client",
        "HKey_Local_Machine\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client"

foreach($k in $key){
            If  ( -Not ( Test-Path "Registry::$k")){New-Item -Path "Registry::$k" -ItemType RegistryKey -Force}
            Set-ItemProperty -path "Registry::$k" -Name "Enabled" -Type "DWord" -Value "00000000"
            Set-ItemProperty -path "Registry::$k" -Name "DisabledByDefault" -Type "DWord" -Value "00000001"
        }

$key =  "HKey_Local_Machine\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server",
        "HKey_Local_Machine\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client"

foreach($k in $key){
            If  ( -Not ( Test-Path "Registry::$k")){New-Item -Path "Registry::$k" -ItemType RegistryKey -Force}
            Set-ItemProperty -path "Registry::$k" -Name "Enabled" -Type "DWord" -Value "00000001"
            Set-ItemProperty -path "Registry::$k" -Name "DisabledByDefault" -Type "DWord" -Value "00000000"
        }

#Cipher Keys 
$ciphers =  "System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\DES 56/56",
            "System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\AES 128/128",
            "System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\AES 256/256",
            "System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC2 128/128",
            "System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC2 40/128",
            "System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC2 56/128",
            "System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 128/128",
            "System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 40/128",
            "System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 56/128",
            "System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\RC4 64/128",
            "System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\Triple DES 168"


foreach($c in $ciphers){
    $key = "HKey_Local_Machine\" + $c
        If  ( -Not ( Test-Path "Registry::$key")){([Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey([Microsoft.Win32.RegistryHive]::LocalMachine, $env:COMPUTERNAME)).CreateSubKey($c)}
                Set-ItemProperty -path "Registry::$key" -Name "Enabled" -Type "DWord" -Value "00000000"
                       }

#SMB Signing
$key =  "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanWorkStation\Parameters",                
        "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanServer\Parameters"

foreach($k in $key){
            If  ( -Not ( Test-Path "Registry::$k")){New-Item -Path "Registry::$k" -ItemType RegistryKey -Force}
            Set-ItemProperty -path "Registry::$k" -Name "RequireSecuritySignature" -Type "DWord" -Value "1"
        }


$key =  "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanWorkStation\Parameters",
        "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanServer\Parameters"                  

foreach($k in $key){
            If  ( -Not ( Test-Path "Registry::$k")){New-Item -Path "Registry::$k" -ItemType RegistryKey -Force}
            Set-ItemProperty -path "Registry::$k" -Name "EnableSecuritySignature" -Type "DWord" -Value "1"
        }
#endregion
