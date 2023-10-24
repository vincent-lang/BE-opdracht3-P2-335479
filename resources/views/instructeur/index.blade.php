<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/app.css">
    <title>Document</title>
</head>

<body>
    <h3>Instructeurs in dienst</h3>
    <h3>aantal instructeurs: {{$instructeursAmount}}</h3>
    <table>
        <thead>
            <th>Voornaam</th>
            <th>Tussenvoegsel</th>
            <th>Achternaam</th>
            <th>Mobiel</th>
            <th>Datum in dienst</th>
            <th>Aantal sterren</th>
            <th>Voertuigen</th>
        </thead>
        <tbody>
            @foreach($instructeurs as $instructeur)
            <tr>
                <td>{{$instructeur->Voornaam}}</td>
                <td>{{$instructeur->Tussenvoegsel}}</td>
                <td>{{$instructeur->Achternaam}}</td>
                <td>{{$instructeur->Mobiel}}</td>
                <td>{{$instructeur->DatumInDienst}}</td>
                <td>{{$instructeur->AantalSterren}}</td>
                <td>
                    <a href="{{route('instructeur.list', [$instructeur->Id])}}">
                        <img src="/img/car.png" alt="car.png">
                    </a>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</body>

</html>