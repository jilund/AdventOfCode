$ErrorActionPreference = 'Stop'
$WarningPreference = 'Continue'

# $list = @(
    # "1abc2",
    # "pqr3stu8vwx",
    # "a1b2c3d4e5f",
    # "treb7uchet"
# );

$list = @(curl "https://raw.githubusercontent.com/jilund/AdventOfCode/main/input.txt")

[int]$values = 0

foreach ($i in $list) {
    Write-Host "---"
    Write-Host "Current line: $($i)"

    $ints = $i -replace "[^\d]", ""
    $start = $ints.Substring(0,1);
    $end = $ints.Substring($ints.Length-1,1)

    Write-Host "Starts with $($start) and ends with $($end)"
    Write-Host "Concat: $($start)$($end)"
    $values = $values + ($start + $end);
    Write-Host "---"

}

Write-Host "Total: $($values)"
