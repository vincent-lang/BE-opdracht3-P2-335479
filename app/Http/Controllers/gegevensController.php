<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use App\Models\VoertuigInstructeur;
use App\Models\Instructeur;
use App\Models\TypeVoertuig;
use App\Models\Voertuig;
use Illuminate\Support\Facades\DB;

class gegevensController extends Controller
{
    public function index()
    {
        $instructeurs = Instructeur::IndexGegevens()->get();
        $Amount = Instructeur::indexAmount()->get();
        $instructeursAmount = count($Amount);
        return view('instructeur.index', compact('instructeurs', 'instructeursAmount'));
    }

    public function list(Instructeur $instructeur)
    {
        $id = $instructeur->Id;
        $instructeurs = Instructeur::ListGegevens()->where('Id', '=', $id)->get();
        $voertuigData = Voertuig::ListVoertuigGegevens()->where('instructeurs.Id', '=', $id)->get();
        return view('instructeur.list', compact('instructeurs', 'voertuigData'));
    }

    public function addPage(Instructeur $instructeur)
    {
        $id = $instructeur->Id;
        $voertuigData = Voertuig::AddPageGegevens()->get();
        return view('instructeur.addPage', ['instructeurs' => $instructeur], compact('voertuigData'));
    }

    public function add(Instructeur $instructeur, $row)
    {
        $instructeurId = $instructeur->Id;
        $voertuigId = $row;
        $DatumToekenning = date('y-m-d');
        $DatumAangemaakt = date('y-m-d h:i:s');
        $DatumGewijzigd = date('y-m-d h:i:s');
        $data = VoertuigInstructeur::insert(array(
            'VoertuigId' => $voertuigId,
            'InstructeurId' => $instructeurId,
            'DatumToekenning' => $DatumToekenning,
            'DatumAangemaakt' => $DatumAangemaakt,
            'DatumGewijzigd' => $DatumGewijzigd
        ));
        return redirect(route('instructeur.list', [$instructeurId]));
    }

    public function edit(Instructeur $instructeur, $row)
    {
        $instructeurId = $instructeur->Id;
        $voertuigId = $row;
        $voertuigData = Voertuig::EditGegevens()->where('Voertuigs.Id', '=', $voertuigId)->get();
        $instructeurData = Instructeur::EditGegevens()->where('Instructeurs.Id', '!=', $instructeurId)->get();
        $typeVoertuigData = TypeVoertuig::EditTypeVoertuigGegevens()->where('Type_Voertuigs.TypeVoertuig', '!=', $voertuigData[0]->TypeVoertuig)->get();
        return view('instructeur.editPage', ['instructeurs' => $instructeur], compact('voertuigData', 'instructeurData', 'typeVoertuigData'));
    }

    public function editAll(Instructeur $instructeur, $row)
    {
        $instructeurId = $instructeur->Id;
        $voertuigId = $row;
        $voertuigData = Voertuig::EditGegevens()->where('Voertuigs.Id', '=', $voertuigId)->get();
        $instructeurData = Instructeur::EditGegevens()->where('Instructeurs.Id', '!=', $instructeurId)->get();
        $typeVoertuigData = TypeVoertuig::EditTypeVoertuigGegevens()->where('Type_Voertuigs.TypeVoertuig', '!=', $voertuigData[0]->TypeVoertuig)->get();
        return view('instructeur.editPageAll', ['instructeurs' => $instructeur], compact('voertuigData', 'instructeurData', 'typeVoertuigData'));
    }

    public function update(Request $request, Instructeur $instructeur, $row)
    {
        // $req = $request->all();
        // dd($req);
        $instructeurId = $instructeur->Id;
        $Idata = $request->validate([
            'InstructeurId' => 'required|integer',
        ]);
        $Vdata = $request->validate([
            'Type' => 'required|string',
            'Bouwjaar' => 'required|date',
            'Brandstof' => 'required|string',
            'Kenteken' => 'required|string'
        ]);
        $TVdata = $request->validate([
            'TypeVoertuigId' => 'required|integer'
        ]);
        $voertuigInstructeur = DB::table('voertuig_instructeurs')->where('VoertuigId', $row)->update($Idata);
        $voertuig = DB::table('voertuigs')->where('Id', $row)->update($Vdata);
        $typeVoertuig = DB::table('voertuigs')->where('Id', $row)->update($TVdata);
        // dd($voertuigInstructeur);

        return redirect(route('instructeur.list', [$instructeurId]));
    }

    public function updateAll(Request $request, Instructeur $instructeur, $row)
    {
        // $req = $request->all();
        // dd($req);
        $instructeurId = $instructeur->Id;
        $voertuigId = $row;
        $DatumToekenning = date('y-m-d');
        $DatumAangemaakt = date('y-m-d h:i:s');
        $DatumGewijzigd = date('y-m-d h:i:s');
        $data = VoertuigInstructeur::insert(array(
            'VoertuigId' => $voertuigId,
            'InstructeurId' => $instructeurId,
            'DatumToekenning' => $DatumToekenning,
            'DatumAangemaakt' => $DatumAangemaakt,
            'DatumGewijzigd' => $DatumGewijzigd
        ));

        $Idata = $request->validate([
            'InstructeurId' => 'required|integer',
        ]);
        $Vdata = $request->validate([
            'Type' => 'required|string',
            'Bouwjaar' => 'required|date',
            'Brandstof' => 'required|string',
            'Kenteken' => 'required|string'
        ]);
        $TVdata = $request->validate([
            'TypeVoertuigId' => 'required|integer'
        ]);
        $voertuigInstructeur = DB::table('voertuig_instructeurs')->where('VoertuigId', $row)->update($Idata);
        $voertuig = DB::table('voertuigs')->where('Id', $row)->update($Vdata);
        $typeVoertuig = DB::table('voertuigs')->where('Id', $row)->update($TVdata);
        // dd($voertuigInstructeur);

        return redirect(route('instructeur.list', [$instructeurId]));
    }

    public function delete(Instructeur $instructeur, $row)
    {
        $instructeurId = $instructeur->Id;
        $voertuigId = $row;

        DB::table('voertuig_instructeurs')->where('VoertuigId', $voertuigId)->delete();

        return redirect(route('instructeur.list', [$instructeurId]))->with('succes', 'Het door u geselecteerde voertuig is verwijderd');
    }

    public function allPage(Instructeur $instructeur)
    {
        $voertuigData = Voertuig::AllPageGegevens()->get();
        $voertuigInstructeurData = VoertuigInstructeur::AllPageGegevens()->get();
        // dd($voertuigInstructeurData);
        return view('instructeur.allPage', ['instructeurs' => $instructeur], compact('voertuigInstructeurData', 'voertuigData'));
    }

    public function deleteAllPage(Instructeur $instructeur, $row)
    {
        $instructeurId = $instructeur->Id;
        $voertuigId = $row;

        DB::table('voertuig_instructeurs')->where('VoertuigId', $voertuigId)->delete();
        DB::table('voertuigs')->where('Id', $voertuigId)->delete();

        return redirect(route('instructeur.allPage', [$instructeurId]))->with('succes', 'Het door u geselecteerde voertuig is verwijderd');
    }
}
