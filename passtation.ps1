param (
    [Parameter(Mandatory=$true, HelpMessage="Please, enter an inital phrase")]
    [string]$phrase,
    [Parameter(Mandatory=$true, HelpMessage="Please, enter an outputfile")]
    [string]$outfile
)

function GeneratePassphrases($phrase) {
    $specials = '!', '@', '#', '$', '%', '&', '*', '_', '-', '+', '?', '.'
    $numbers = 0..9
    $dates = '2020', '2022', '2023'
    $passphrases = @()

    foreach ($special in $specials) {
        $passphrases += $phrase + $special
    }

    foreach ($number in $numbers) {
        $passphrases += $phrase + $number
    }

    foreach ($special in $specials) {
        foreach ($number in $numbers) {
            $passphrases += $phrase + $special + $number
            $passphrases += $phrase + $number + $special
        }
    }

    foreach ($date in $dates) {
        foreach ($special in $specials) {
            $passphrases += $phrase + $date + $special
            $passphrases += $phrase + $special + $date
        }
    }

    return $passphrases
}

$passphrases = GeneratePassphrases $phrase

foreach ($passphrase in $passphrases) {
    Add-Content -Path $outfile -Value $passphrase
}
