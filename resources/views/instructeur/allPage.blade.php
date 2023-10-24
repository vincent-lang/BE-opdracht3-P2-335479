<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/app.css">
    <title>Document</title>
</head>

<body>
    <h3>Alle voertuigen</h3>
    <div>
        @if(session()->has('succes'))
        <div>
            <h3 class="succes-text">
                {{session('succes')}}
            </h3>
        </div>
        <script>
            setTimeout(function() {
                window.location.href = "{{route('instructeur.allPage', [$instructeurs->Id])}}"
            }, 3000);
        </script>
        @endif
    </div>
    @if($voertuigData->isEmpty() && $voertuigInstructeurData->isEmpty())
    <h3 class="succes-text">
        Er zijn geen voertuigen beschikbaar op dit moment.
    </h3>
    <script>
        setTimeout(function() {
            window.location.href = "{{route('instructeur.index')}}"
        }, 3000);
    </script>
    @else
    <table>
        <thead>
            <th>Type voertuig</th>
            <th>Type</th>
            <th>Kenteken</th>
            <th>Bouwjaar</th>
            <th>Brandstof</th>
            <th>Rijbewijs categorie</th>
            <th>Instructeur naam</th>
            <th>Verwijderen</th>
        </thead>
        <tbody>
            @foreach($voertuigData as $row)
            <tr>
                <td>{{$row->TypeVoertuig}}</td>
                <td>{{$row->Type}}</td>
                <td>{{$row->Kenteken}}</td>
                <td>{{$row->Bouwjaar}}</td>
                <td>{{$row->Brandstof}}</td>
                <td>{{$row->Rijbewijscategorie}}</td>
                <td></td>
                <td>
                    <a href="{{route('instructeur.deleteAllPage', [$instructeurs->Id, $row->Id])}}">
                        <img class="small-img" src="/img/delete.png" alt="delete.png">
                    </a>
                </td>
            </tr>
            @endforeach
        </tbody>
        <tbody>
            @foreach($voertuigInstructeurData as $row)
            <tr>
                <td>{{$row->TypeVoertuig}}</td>
                <td>{{$row->Type}}</td>
                <td>{{$row->Kenteken}}</td>
                <td>{{$row->Bouwjaar}}</td>
                <td>{{$row->Brandstof}}</td>
                <td>{{$row->Rijbewijscategorie}}</td>
                <td>{{$row->Achternaam}}</td>
                <td>
                    <a href="{{route('instructeur.deleteAllPage', [$instructeurs->Id, $row->Id])}}">
                        <img class="small-img" src="/img/delete.png" alt="delete.png">
                    </a>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
    @endif
    <h3>
        <a href="{{route('instructeur.list', [$instructeurs->Id])}}">go back</a>
    </h3>
</body>

</html>