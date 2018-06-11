Prisijungimo duomenis:

Administratorius: User: admin@admin.lt ; Password: admin123	
Maitinimo įstaiga: User: istaiga@istaiga.lt ; Password: istaiga123	
Klientas:	User: klientas@klientas.lt ; Password: klientas123	

Šie vartotojai yra užregistruoti, taip pat galima registruotis ir kurti naujus vartotojus.


Instrukcija kaip paleisti sistemą ant Windows OS:
1. Sistemai paleisti reikalinga MySQL duomenų bazės įrankis, galima naudoti pvz "XAMPP".

2. MySQL duomenų bazėje reikia paleisti "catering_system.sql" bylą kuri yra ./Database_sql/catering_system.sql aplankale. 

3. Duomenų bazės pavadinimas yra "catering_system_3", sistemoje jau yra nustatytas toks pats pavadinimas prisijungimui prie duomenų bazės, be slaptažodžio. Jeigu keisite duomenų bazės pavadinimą arba naudosite slaptažodį, arba naudosite vartotoją ne "root" - tai reikėtų aprašyti ".env" byloje, kuri randasi "/catering_system/.env", prie eilučių atitinkamai: "DB_DATABASE=", "DB_USERNAME=" ir "DB_PASSWORD=".

4. Paleidžiame bylą "start_artisan_serve.bat" kuri randasi "catering_system/". Sistema turi būti pasiekiama adresu: http://localhost:8080/ . Jeigu neiveikia tada darome 5 - 6 žingsnius. 
 
5. Užeiname į "/catering_system/", atidarome ten windows komandinę eilutę (CMD), galima atidaryti laikant kairyjį "Shift" ir paspaudus dešiuoju pėlės mygtuku ant tuščios vietos aplankale, tuomet atidariusame meniu reikia pasirinkti - "Open PowerShell window here".

6. Įvedame tokią komandą: "php artisan serve --port=8080", turi pasirodyti užrašas: "Laravel development server started on http://localhost:8080/".
Tuomet sistema pasiekiama adresu: http://localhost:8080/ . "--port=" eilutėje galima nurodyti kitokį portą.