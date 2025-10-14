cd $PSScriptRoot

function readConfiguration(){
    $configtxt = (Get-Content configuration.txt).Split("`n")
    $config = [PSCustomObject]@{
            Days = $configtxt[0]
            Time = $configtxt[1]
    }
return $config
}

function changeConfiguration{
    $validinput = $false
    $config = readConfiguration
        while(!$validinput){
            Write-Host "`nHow many days should the logs be evaluated for?"
            $days = Read-Host
            if($days -match '[0-9]'){
                $validinput = $True
                $config.days = $days
            }
        }

     $validinput = $false
     while(!$validinput){
         Write-Host "`nWhat time should the logs be evaluated at"
         $time = Read-Host
         if($time -match '^(1[0-2]|0?[1-9]):[0-5][0-9] (AM|PM)$'){
             $validinput = $True
             $config.time = $time
             $days | out-file -filepath configuration.txt
             $time | out-file -filepath configuration.txt -append
             Write-host "`nConfiguration changed."
         }
     }
}


function configurationMenu{
    $Prompt = "`n1. Show Configuration`n"
    $Prompt += "2. Change Configuration`n"
    $Prompt += "3. Exit`n`n"
    $Prompt += "Enter a number (1-3) to choose an option: "

    $operation = $true

    while($operation){

       Write-Host $Prompt | Out-String
        $choice = Read-Host 
    
        if($choice -eq "1"){
            $config = readConfiguration
            Write-Host "`nDays:"$config.Days`
            "`nTime:"$config.Time"`n"
        }

        if($choice -eq "2"){
            changeConfiguration
        
        }

        if($choice -eq "3"){
            $operation = $false
            return
        }

    }
}
configurationMenu