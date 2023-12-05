$ErrorActionPreference = 'Stop'
$WarningPreference = 'Continue'

# $list = @(
# "1abc2",
# "pqr3stu8vwx",
# "a1b2c3d4e5f",
# "treb7uchet"
# );

$list = @(curl "https://raw.githubusercontent.com/jilund/AdventOfCode/main/input.txt")
$intsub = @{
    "one"   = "1"
    "two"   = "2"
    "three" = "3"
    "four"  = "4"
    "five"  = "5"
    "six"   = "6"
    "seven" = "7"
    "eight" = "8"
    "nine"  = "9"
}

[int]$values = 0

foreach ($i in $list) {
    Write-Host "---"
    Write-Host "Current line: $($i)"

    $intsub.GetEnumerator() | ForEach-Object {
        $i = $i.Replace($_.Name, $_.Value)
    }
    Write-Host "After string->int replace: $($i)"

    $ints = $i -replace "[^\d]", ""
    Write-Host "After string strip: $($ints)"
    $start = $ints.Substring(0, 1)
    $end = $ints.Substring($ints.Length - 1, 1)

    Write-Host "Start: $($start) end: $($end)"
    $values = $values + ($start + $end)
    Write-Host "---"

}

Write-Host "Total: $($values)"
