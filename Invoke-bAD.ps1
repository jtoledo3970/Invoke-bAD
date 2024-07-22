# Connect to the domain
Import-Module ActiveDirectory

# Define a list of easy passwords
$passwordList = @("123456", "123456789", "qwerty", "password", "111111", "12345678", "abc123", "1234567", "password1", "1234567890", "123123", "000000", "iloveyou", "1q2w3e4r5t", "qwertyuiop", "monkey", "dragon", "123456a", "654321", "123321", "666666", "1qaz2wsx", "myspace1", "121212", "homelesspa", "123qwe", "a123456", "123abc", "1q2w3e4r", "qwe123", "7777777", "qwerty123", "target123", "tinkle", "987654321", "qwerty1", "222222", "zxcvbnm", "1g2w3e4r", "gwerty", "zag12wsx", "gwerty123", "555555", "fuckyou", "112233", "asdfghjkl", "123123123", "qazwsx", "computer", "princess", "12345a", "ashley", "159753", "michael", "football", "sunshine", "1234qwer", "iloveyou1", "aaaaaa", "fuckyou1", "789456123", "daniel", "777777", "princess1", "123654", "asdfgh", "999999", "11111111", "passer2009", "888888", "abcd1234", "shadow", "football1", "love123", "superman", "jordan23", "jessica", "monkey1", "12qwaszx", "a12345", "baseball", "123456789a", "killer", "asdf", "samsung", "master", "azerty", "charlie", "asd123", "soccer", "FQRG7CS493", "88888888", "jordan", "michael1", "jesus1", "linkedin", "babygirl1", "789456", "blink182", "thomas", "qwer1234", "333333", "liverpool", "michelle", "nicole", "qwert", "j38ifUbn", "131313", "asdasd", "987654", "lovely", "q1w2e3r4", "0123456789", "gfhjkm", "andrew", "hello1", "joshua", "Status", "justin", "anthony", "angel1", "iloveyou2", "1111111", "zxcvbn", "hello", "jennifer", "hunter", "naruto", "bitch1", "welcome", "159357", "101010", "tigger", "147258369", "babygirl", "jessica1", "parola", "5201314", "robert", "fuckyou2", "696969", "102030", "0987654321", "loveme", "123456q", "apple", "pokemon", "mother", "money1", "secret", "anthony1", "purple", "q1w2e3r4t5y6", "baseball1", "qazwsxedc", "1111111111", "buster", "matthew", "andrea", "soccer1", "basketball", "hannah", "freedom", "golfer", "chelsea", "passw0rd", "george", "trustno1", "friends", "william", "iloveu", "amanda", "number1", "chocolate", "qwerty12", "summer", "flower", "charlie1", "maggie", "pakistan", "samantha", "asdf1234", "letmein", "asshole1", "superman1", "marina", "147258", "batman", "fuk19600", "butterfly", "010203", "qweqwe", "29rsavoy", "forever", "mustang", "sunshine1", "ashley1", "internet", "london", "harley", "alexander", "xbox360", "12341234", "pepper", "family", "loveyou", "50cent", "joseph", "whatever", "jasmine", "orange", "junior", "cookie", "martin", "qweasdzxc", "212121", "1qazxsw2", "password12", "google", "password2", "111222", "lol123", "hello123", "jordan1", "shadow1", "patrick", "3rJs1la7qE", "ginger", "nicole1", "mylove", "arsenal", "12344321", "abcdef", "love12", "232323", "VQsaBLPzLa", "taylor", "myspace", "brandon", "angel", "12345q", "brandon1", "chris1", "diamond", "snoopy", "asshole", "qweasd", "starwars", "matrix", "mickey", "school", "jonathan", "melissa", "eminem", "1234561", "cjmasterinf", "lovers", "1234567891", "nikita", "richard", "yellow", "12345qwert", "oliver", "q1w2e3r4t5", "cheese", "a123456789", "christian", "290966", "wall.e", "12345678910", "sophie", "tudelft", "DIOSESFIEL", "dpbk1234", "PE#5GZ29PTZMSE")

# Define a list of city names
$cityList = @("Ahmedabad", "Alexandria", "Atlanta", "Baghdad", "Bangalore", "Bangkok", "Barcelona", "Beijing", "Belo Horizonte", "Bogotá", "Buenos Aires", "Cairo", "Chengdu", "Chennai", "Chicago", "Chongqing", "Dalian", "Dallas", "Dar es Salaam", "Delhi", "Dhaka", "Dongguan", "Foshan", "Fresno", "Fukuoka", "Guadalajara", "Guangzhou", "Hangzhou", "Harbin", "Ho Chi Minh City", "Hong Kong", "Houston", "Hyderabad", "Istanbul", "Jakarta", "Jinan", "Johannesburg", "Karachi", "Khartoum", "Kinshasa", "Kolkata", "Kuala Lumpur", "Lagos", "Lahore", "Lima", "London", "Los Angeles", "Luanda", "Madrid", "Manila", "Mexico City", "Miami", "Moscow", "Mumbai", "Nagoya", "Nanjing", "New York", "Osaka", "Paris", "Philadelphia", "Pune", "Qingdao", "Rio de Janeiro", "Riyadh", "Sacramento", "Saint Petersburg", "Santiago", "São Paulo", "Seoul", "Shanghai", "Shenyang", "Shenzhen", "Singapore", "Surat", "Suzhou", "Tehran", "Tianjin", "Tokyo", "Toronto", "Washington", "Winton", "Wuhan", "Xi'an", "Yangon")

# Function to generate a random name
function Get-RandomName {
    $firstNames = @("Jose", "Miguel", "Daniel", "Edith", "Esther", "Carolina", "Jesus", "Liam", "Noah", "Oliver", "Elijah", "William", "James", "Benjamin", "Lucas", "Henry", "Alexander", "Mason", "Michael", "Ethan", "Daniel", "Jacob", "Logan", "Jackson", "Levi", "Sebastian", "Mateo", "Jack", "Owen", "Theodore", "Aiden", "Samuel", "Joseph", "John", "David", "Wyatt", "Matthew", "Luke", "Asher", "Carter", "Julian", "Grayson", "Leo", "Jayden", "Gabriel", "Isaac", "Lincoln", "Anthony", "Hudson", "Dylan", "Ezra", "Thomas", "Charles", "Christopher", "Jaxon", "Maverick", "Josiah", "Isaiah", "Andrew", "Elias", "Joshua", "Nathan", "Caleb", "Ryan", "Adrian", "Miles", "Eli", "Nolan", "Christian", "Aaron", "Cameron", "Ezekiel", "Colton", "Luca", "Landon", "Hunter", "Jonathan", "Santiago", "Axel", "Easton", "Cooper", "Jeremiah", "Angel", "Roman", "Connor", "Jameson", "Robert", "Greyson", "Jordan", "Ian", "Carson", "Jaxson", "Leonardo", "Nicholas", "Dominic", "Austin", "Everett", "Brooks", "Xavier", "Kai", "Jose", "Parker")
    $lastNames = @("Garcia", "Rodriguez", "Martinez", "Hernandez", "Lopez", "Gonzalez", "Perez", "Sanchez", "Ramirez", "Torres", "Flores", "Rivera", "Gomez", "Diaz", "Cruz", "Morales", "Reyes", "Gutierrez", "Ortiz", "Chavez", "Ramos", "Ruiz", "Mendoza", "Alvarez", "Jimenez", "Castillo", "Vasquez", "Romero", "Moreno", "Gonzales", "Herrera", "Aguilar", "Medina", "Vargas", "Castro", "Guzman", "Mendez", "Fernandez", "Munoz", "Salazar", "Garza", "Soto", "Vazquez", "Alvarado", "Contreras", "Delgado", "Pena", "Rios", "Guerrero", "Sandoval", "Ortega", "Estrada", "Nunez", "Maldonado", "Dominguez", "Valdez", "Vega", "Santiago", "Espinoza", "Rojas", "Silva", "Mejia", "Marquez", "Juarez", "Padilla", "Luna", "Acosta", "Figueroa", "Cortez", "Smith", "Johnson", "Williams", "Brown", "Jones", "Miller", "Davis", "Wilson", "Moore", "Taylor", "Anderson", "Thomas", "Jackson", "White", "Harris", "Martin", "Thompson", "Garcia", "Martinez", "Robinson", "Clark", "Rodriguez", "Lewis", "Lee", "Walker", "Hall", "Allen")
    $firstName = $firstNames | Get-Random
    $lastName = $lastNames | Get-Random
    return @{FirstName=$firstName; LastName=$lastName; UserName="$firstName.$lastName"}
}

# Function to show a banner when run
function ShowBanner {
    $banner  = @()
    $banner+= '========================================'
    $banner+= 'Invoke-bAD'
    $banner+= ''                                                  
    $banner+= 'By Jose Toledo @enigmatracer'
    $banner+= '========================================'
    $banner | foreach-object {
        Write-Host $_
    }                             
}

# Function to generate a random workstation name
function Get-RandomWorkstationName {
    $prefixes = @("WS", "PC", "LT")
    $suffix = Get-Random -Minimum 1000 -Maximum 9999
    return "$($prefixes | Get-Random)-$suffix"
}

# Get the domain distinguished name
$domainDN = (Get-ADDomain).DistinguishedName

# Show banner
ShowBanner

# Reduce password policy to disable complexity and length to 4
Set-ADDefaultDomainPasswordPolicy -Identity $domainDN -ComplexityEnabled $false -MinPasswordLength 4

# Prompt for number of OUs, number of users, and number of workstations
$numOUs = Read-Host "Enter the number of Organizational Units to create"
$numUsers = Read-Host "Enter the number of users to create"
$numWorkstations = Read-Host "Enter the number of workstations to create"

# Get the current user's desktop path
$desktopPath = [System.Environment]::GetFolderPath('Desktop')
$logFilePath = "$desktopPath\adgen-log.txt"

# Initialize log file
"AD Generation Log" | Out-File -FilePath $logFilePath

# Track created OUs, users, and workstations
$createdOUs = @()
$createdUsers = @()
$createdWorkstations = @()

# Create Organizational Units and folders
for ($i = 1; $i -le $numOUs; $i++) {
    $cityName = $cityList | Get-Random
    while ($createdOUs -contains $cityName) {
        $cityName = $cityList | Get-Random
    }
    $createdOUs += $cityName
    $ouName = "$cityName"
    try {
        New-ADOrganizationalUnit -Name $ouName -Path $domainDN
        Write-Host "Created OU: $ouName"
        "Created OU: $ouName" | Out-File -FilePath $logFilePath -Append
    } catch {
        Write-Host "Failed to create OU: $ouName. Error: $_" -ForegroundColor Red
        "Failed to create OU: $ouName. Error: $_" | Out-File -FilePath $logFilePath -Append
    }
    
    # Create folders within each OU
    $folders = @("Servers", "Users", "Workstations")
    foreach ($folder in $folders) {
        try {
            New-ADOrganizationalUnit -Name $folder -Path "OU=$ouName,$domainDN"
            Write-Host "Created folder: $folder in $ouName"
            "Created folder: $folder in $ouName" | Out-File -FilePath $logFilePath -Append
        } catch {
            Write-Host "Failed to create folder: $folder in $ouName. Error: $_" -ForegroundColor Red
            "Failed to create folder: $folder in $ouName. Error: $_" | Out-File -FilePath $logFilePath -Append
        }
    }
}

# Create Users and assign them to random Users folder within OUs
for ($i = 1; $i -le $numUsers; $i++) {
    $name = Get-RandomName
    $userName = $name.UserName
    while ($createdUsers -contains $userName) {
        $name = Get-RandomName
        $userName = $name.UserName
    }
    $createdUsers += $userName
    $password = $passwordList | Get-Random
    $ouIndex = Get-Random -Minimum 1 -Maximum $numOUs
    $cityName = $createdOUs[$ouIndex - 1]
    $ouPath = "OU=Users,OU=$cityName,$domainDN"
    
    try {
        New-ADUser -Name $userName -GivenName $name.FirstName -Surname $name.LastName -UserPrincipalName "$userName@$domainDN" -AccountPassword (ConvertTo-SecureString $password -AsPlainText -Force) -Path $ouPath -Enabled $true
        Write-Host "Created User: $userName in $ouPath with password: $password"
        "Created User: $userName in $ouPath with password: $password" | Out-File -FilePath $logFilePath -Append
        
        # Assign some users to admin groups
        if ($i % 5 -eq 0) {
            Add-ADGroupMember -Identity "Domain Admins" -Members $userName
            Write-Host "Added $userName to Domain Admins"
            "Added $userName to Domain Admins" | Out-File -FilePath $logFilePath -Append
        } elseif ($i % 10 -eq 0) {
            Add-ADGroupMember -Identity "Enterprise Admins" -Members $userName
            Write-Host "Added $userName to Enterprise Admins"
            "Added $userName to Enterprise Admins" | Out-File -FilePath $logFilePath -Append
        }
        
        # Randomly add users to Remote Management Users and Remote Desktop Users groups
        $randomRMU = Get-Random
        if ($randomRMU % 15 -eq 0) {
            Add-ADGroupMember -Identity "Remote Management Users" -Members $userName
            Write-Host "Added $userName to Remote Management Users"
            "Added $userName to Remote Management Users" | Out-File -FilePath $logFilePath -Append
        }
        $randomRDS = Get-Random
        if ($randomRDS % 2 -eq 0) {
            Add-ADGroupMember -Identity "Remote Desktop Users" -Members $userName
            Write-Host "Added $userName to Remote Desktop Users"
            "Added $userName to Remote Desktop Users" | Out-File -FilePath $logFilePath -Append
        }
    } catch {
        Write-Host "Failed to create User: $userName in $ouPath. Error: $_" -ForegroundColor Red
        "Failed to create User: $userName in $ouPath. Error: $_" | Out-File -FilePath $logFilePath -Append
    }
}

# Create Workstations and assign them to random Workstations folder within OUs
for ($i = 1; $i -le $numWorkstations; $i++) {
    $workstationName = Get-RandomWorkstationName
    while ($createdWorkstations -contains $workstationName) {
        $workstationName = Get-RandomWorkstationName
    }
    $createdWorkstations += $workstationName
    $ouIndex = Get-Random -Minimum 1 -Maximum $numOUs
    $cityName = $createdOUs[$ouIndex - 1]
    $ouPath = "OU=Workstations,OU=$cityName,$domainDN"
    
    try {
        New-ADComputer -Name $workstationName -Path $ouPath -Enabled $true
        Write-Host "Created Workstation: $workstationName in $ouPath"
        "Created Workstation: $workstationName in $ouPath" | Out-File -FilePath $logFilePath -Append
    } catch {
        Write-Host "Failed to create Workstation: $workstationName in $ouPath. Error: $_" -ForegroundColor Red
        "Failed to create Workstation: $workstationName in $ouPath. Error: $_" | Out-File -FilePath $logFilePath -Append
    }
}
