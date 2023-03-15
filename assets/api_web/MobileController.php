<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Auth;
use App\Models\User;
use App\Models\Offre;
use App\Models\Candidature;
use App\Models\Produit;
use App\Models\Client;
use App\Models\Photo;
use App\Models\Commande;
use App\Models\ProduitCommande;
use Stdfn;

class MobileController extends Controller
{
    public function __construct()
    {
        //$this->middleware('auth');
    }
    
    public function alert_emploi(Request $request){
        
        $user = auth('api')->user();
        return response()->json(['success' => 'Successfull', 'user'=>$user], 200);
    }
    
    public function register(Request $request)
    {
		
		/*$validation = $request->validate([
			'email' => 'required|unique:users|max:255',
			'password' => 'required',
			'nom' => 'required',
			'prenoms' => 'required',
		]);*/
	
		$user = new User();
		$user->profil_id= 3;
		$user->situation_id= $request->situation_id;
		$user->prenoms= $request->prenoms;
		$user->name= $request->nom;
		$user->email= $request->email;
		$user->diplome_id= $request->diplome;
		$user->experience= $request->experience;
		
		$user->user_dpc= $request->user_dpc;
		$user->user_cv= $request->user_cv;
		$user->user_att= $request->user_att;
		$user->password= bcrypt($request->password);
		
		if($request->hasFile('cni')) {
            
            $fichier = $request->file('cni');
    		
    		$filename_cni = 'cni_'. md5($request->email) . '.' . $fichier->extension();
    		
            $fichier->move(public_path('assets/img/profil/documents'), $filename_cni);
            
            $user->user_cni = $filename_cni;
            
        }
        if($request->hasFile('dpc')) {
            
            $fichier = $request->file('dpc');
    		
    		$filename_dpc = 'dpc_'. md5($request->email) . '.' . $fichier->extension();
    		
            $fichier->move(public_path('assets/img/profil/documents'), $filename_dpc);
            
            $user->user_dpc = $filename_dpc;
            
        }
        if($request->hasFile('cv')) {
            
            $fichier = $request->file('cv');
    		
    		$filename_cv = 'cv_'. md5($request->email) . '.' . $fichier->extension();
    		
            $fichier->move(public_path('assets/img/profil/documents'), $filename_cv);
            
            $user->user_cv = $filename_cv;
            
        }
        if($request->hasFile('att')) {
            
            $fichier = $request->file('att');
    		
    		$filename_att = 'att_'. md5($request->email) . '.' . $fichier->extension();
    		
            $fichier->move(public_path('assets/img/profil/documents'), $filename_att);
            
            $user->user_att = $filename_att;
            
        }
        
		$otp = Stdfn::genererOTP();
		$user->otp = $otp;
		$user->save();
		
		/*
		//send otp via mail
        $email_data = array(
            'email' => $user->email,
            'nom' => $user->name,
            'prenoms' => $user->prenoms,
            'otp' => $user->otp,
        );
        Mail::send('emails.email_otp', $email_data, function ($message) use ($email_data){
			$message->to($email_data['email'])
				->subject("Code de connexion")
				->from('noreply@anpe.com', 'ANPE');
        });
        */
        
		//connecter l'utilisateur
		if (!$token = Auth()->attempt(['email' => $request->email, 'password' => $request->password])) {
				
            return response()->json(['error' => 'Unauthorized'], 401);

        }
		
        $user = Auth()->user();
        $token = $user->createToken('JOBBOARD')->accessToken;
		
        return $this->responseWithToken($token, $user);
		
	}

	
    public function resend_otp($user_id)
    {
		$user = User::find($user_id);

		//send otp via mail
        $email_data = array(
            'email' => $user->email,
            'nom' => $user->name,
            'prenoms' => $user->prenoms,
            'otp' => $user->otp,
        );
		
        Mail::send('emails.email_otp', $email_data, function ($message) use ($email_data){
			$message->to($email_data['email'])
				->subject("Code de connexion")
				->from('noreply@anpe.com', 'ANPE');
        });

	}

	
    public function update_profile(Request $request)
    {
		
		// $validation = $request->validate([
			// 'email' => 'required|max:255',
			// 'password' => 'required',
			// 'nom' => 'required',
			// 'prenoms' => 'required',
		// ]);
	    
	    $user = auth('api')->user();
		//$user = User::where(['email'=>$request->email])->first();
		$user->prenoms= $request->prenoms;
		$user->name= $request->nom;
		$user->telephone= $request->telephone;
		$user->genre= $request->genre;
		$user->adresse= $request->adresse;
		$user->diplome_id= $request->diplome;
		$user->experience= $request->experience;
		
		
		
        if($request->hasFile('photo')) {
            
            $fichier 		= $request->file('photo');
    		
    		$filename = 'user_'.$user->id . '.' . $fichier->extension();
    		
            $fichier->move(public_path('assets/img/profil'), $filename);
            
            $user->profil_photo = $filename;
            
        }
        
        $user->exists = true;
		$user->save();
        
		//connecter l'utilisateur
		
        //$token = $user->createToken('JOBBOARD')->plainTextToken;
        $token = $user->createToken('JOBBOARD')->accessToken;
		
        return $this->responseWithToken($token,$user);
		
	}
	
	
    public function login(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'email' => 'required',
            'password' => 'required',
        ]);

        if ($validation->fails()) {
            return response()->json(['message'=>"Identifiant requis",'error' => $validation->errors()],400);
        }

        if (!$token = Auth()->attempt(['email' => $request->email, 'password' => $request->password])) {

            return response()->json(['error' => 'Unauthorized'], 401);

        }

        $user = auth()->user();
        //$token = $user->createToken('JOBBOARD')->plainTextToken;
        $token = $user->createToken('JOBBOARD')->accessToken;
        
        
        return $this->responseWithToken($token, $user);
    }

    public function unauthorize()
    {
        return response()->json(['error'=>"Unauthorize"],401);
    }

    public function logout()
    {
        auth()->logout();

        return response()->json(['message' => 'Successfully logged out']);
    }

    public function user(Request $request)
    {
        return response()->json(auth()->user());
    }

    protected function responseWithToken($token, $user)
    {
        return response()->json([
            'access_token'=>$token,
            'user'=>$user,
            'id'=>$user->id."",
            'firstname'=>$user->prenoms,
            'lastname'=>$user->name,
            'email'=>$user->email,
            'telephone'=>$user->telephone,
            'adresse'=>$user->adresse,
            'genre'=>$user->genre,
            'photo'=>!empty($user->profil_photo)? "http://jobboard.target-ci.com/assets/img/profil/".$user->profil_photo : "",
            'cni'=>!empty($user->cni)? "http://jobboard.target-ci.com/assets/img/profil/documents/".$user->cni : "",
            'dpc'=>!empty($user->dpc)? "http://jobboard.target-ci.com/assets/img/profil/documents/".$user->dpc : "",
            'cv'=>!empty($user->cv)? "http://jobboard.target-ci.com/assets/img/profil/documents/".$user->cv : "",
            'att'=>!empty($user->att)? "http://jobboard.target-ci.com/assets/img/profil/documents/".$user->att : "",
            'experience'=>$user->experience,
            'domaine'=>$user->domaine_id,
            'otp'=>$user->otp,
            'token_type'=>'Bearer'
        ]);
    }
    
    
    public function candidats(Request $request)
    {
        if(auth('api')->user()->profil_id==1){
    		$candidats = User::select('name','prenoms','diplomelib','metier_libelle','cv_joint')
                		->join('diplome','diplome.diplome_id','users.diplome_id')
                		->join('metier','metier.metier_id','users.metier_id')
                		->where(['profil_id'=>3])
                		->get();
    		
    		foreach($candidats as $candidat){
    		    $candidat->cv_joint = "http://jobboard.target-ci.com/cv/".$candidat->cv_joint;
    		}
    		return $candidats;
        }else{
            return $this->unauthorize();
        }
		
	}
	
	//récupère toutes les offres pour y faire des recherches
    public function offres_all(Request $request)
    {
        
		$offres = Offre::join('users','users.id','offre.user_id')->orderByDesc('offre.offre_id')->get();
		
		foreach($offres as &$offre){
		    
		    $offre->offretitre = $offre->offretitre;
		    $offre->pays = $offre->pays_id;
		    $offre->empactivite = $offre->empactivite_id;
		    $offre->tempstravail = $offre->tempstravail_id;
		    $offre->modereception = $offre->modereception_id;
		    $offre->experience = $offre->experience_id;
		    $offre->typetravail = $offre->typecontrat_id;
		    
		    $offre->offre_image = "http://jobboard.target-ci.com/assets/img/entreprise/".$offre->entreprise_logo;
		    $offre->offre_partage = 2;
		    $offre->offre_like = 10;
		    $offre->postulable = 1;
		    
		}
		
		return $offres;

	}
	
	
    public function offres(Request $request, $user_id, $type=0)
    {
        
        $user = auth('api')->user();
        $diplome_id = intval($user->diplome_id);
        
        $type = intval($type);
        
        $offres_deja_postule = Offre::join('users','users.id','offre.user_id')
                		    ->join('metier','metier.metier_id','offre.metier_id')
                		    ->join('diplome','diplome.diplome_id','offre.diplome_id')
                		    ->join('typecontrat','typecontrat.typecontrat_id','offre.typecontrat_id')
                		    ->join('candidature','candidature.offre_id','offre.offre_id')
                		    ->where(['candidature.user_id'=>$user->id])
                		    ->orderByDesc('offre.offre_id')
                		    ->get();
                		    
		if($type == 1){//selon profil
		    
		    $offres = Offre::join('users','users.id','offre.user_id')
                		    ->join('metier','metier.metier_id','offre.metier_id')
                		    ->join('diplome','diplome.diplome_id','offre.diplome_id')
                		    ->join('typecontrat','typecontrat.typecontrat_id','offre.typecontrat_id')
                		    ->whereRaw('offre.diplome_id <= '.$diplome_id)
                		    ->orderByDesc('offre.offre_id')
                		    ->get();
		    
		}elseif($type==2){
		    //les autres offres
		    $offres = Offre::join('users','users.id','offre.user_id')
                		    ->join('metier','metier.metier_id','offre.metier_id')
                		    ->join('diplome','diplome.diplome_id','offre.diplome_id')
                		    ->join('typecontrat','typecontrat.typecontrat_id','offre.typecontrat_id')
                		    ->whereRaw('offre.diplome_id > '.$diplome_id)
                		    ->orderByDesc('offre.offre_id')
                		    ->get();
		    
		}elseif($type==3){
		    
		    $offres = Offre::join('users','users.id','offre.user_id')
                		    ->join('metier','metier.metier_id','offre.metier_id')
                		    ->join('diplome','diplome.diplome_id','offre.diplome_id')
                		    ->join('typecontrat','typecontrat.typecontrat_id','offre.typecontrat_id')
                		    ->whereRaw('offre.diplome_id <= '.$diplome_id)
                		    ->orderByDesc('offre.offre_id')
                		    ->get();
		    
		}else{
		    
		    //deja postule
		    $offres = $offres_deja_postule;
		    
		}
		
		
		foreach($offres as &$offre){
		    
		    $offre->offredescription = html_entity_decode($offre->offredescription);
		    $offre->pays = $offre->pays_id;
		    $offre->offre_datepublic = Stdfn::dateFromDB($offre->offre_datepublic);
		    $offre->offre_datefin = Stdfn::dateFromDB($offre->offre_datefin);
		    
		    $offre->offre_image = "http://jobboard.target-ci.com/assets/img/entreprise/".$offre->entreprise_logo;
		    $offre->offre_partage = 2;
		    $offre->offre_like = 10;
		    $offre->postulable = $type > 2 ? 0 : 1;
		    
		}
		
		return $offres;
		
	}
	
    public function postuler(Request $request)
    {
		$user_id = auth('api')->user()->id;
		$offre_id = $request->offre_id;
		
		$candidature = new Candidature();
		$candidature->user_id = $user_id;
		$candidature->offre_id = $offre_id;
		$candidature->candidature_datecrea = gmdate('Y-m-d H:i:s');
		$candidature->candidature_statut = 'BROUILLON';
		$candidature->save();
		
		
		return ['status'=>1, 'message'=>'POSTULE OK', 'user'=>$user_id, 'offre'=>$offre_id];
		
	}
	
	
	//
	public function clients(Request $request)
    {
        
		$clients = Client::where(['client_statut'=>'VALIDE'])->get();
		
		foreach($clients as $client){
		    $client->client_photo = $client->client_photo;
		}
		
		return $clients;
    
	}
	
	
	//
	public function produits(Request $request)
    {
        
		$produits = Produit::join('categoriedeproduit','categoriedeproduit.categorie_id','produit.categorie_id')->where(['produit_statut'=>'VALIDE'])->get()->sortByDesc('produit_id');
        
        $listeProduits = [];
        
        foreach($produits as $produit){
            
          $produit->produit_photo_principale = $produit->produit_photo_principale;

          $photos = Photo::where(['produit_id'=>$produit->produit_id, 'photo_statut'=>'VALIDE'])->get();
          foreach($photos as $photo){
              $photo->photo_src = $photo->photo_src;
          }
		  $produit->photo = $photos;
		    
		  $listeProduits[] = $produit;
		  
		}
		 
		return $listeProduits;
    
	}
	
	
	//
	public function commandes(Request $request)
    {
        
		$produits = Commande::join('produit_commande','produit_commande.commande_id','commande.commande_id')
		->join('produit','produit.produit_id','produit_commande.produit_id')
		->where(['commande_statut'=>'VALIDE'])->get()->sortByDesc('commande.commande_id');
        
        $listeProduits = [];
        
        $commandes = Commande::where(['commande_statut'=>'VALIDE'])->get()->sortByDesc('commande_id');
		
    	foreach($commandes as $commande){
    		$pc = ProduitCommande::join('produit','produit.produit_id','produit_commande.produit_id')->where(['commande_id'=>$commande->commande_id])->get();
    		$client = Client::where(['client_id'=>$commande->client_id])->first();
            
        	$commande->client = $client;
        	$commande->produit_commande = $pc;
        	
        	$listeProduits[] = $commande;
        	  
		}
		
		return $listeProduits;
    
	}
	
	public function add_client(Request $request)
    {
		$client = new Client();
		$client->client_nom = $request->nom;
		$client->client_prenoms = $request->prenoms;
		$client->client_telephone = $request->telephone;
		$client->client_email = $request->email;
		$client->client_adresse = $request->adresse;
		
		if($request->hasFile('client_photo')) {
            
            $file  = $request->file('client_photo');
    		
    		$filename = Stdfn::guidv4() . '.' . $file->extension();
    		
            $file->move(public_path('photos/clients'), $filename);
            
            $client->client_photo = $filename;
            
        }
        
		$client->client_date_creation = gmdate('Y-m-d H:i:s');
		$client->save();
		
		return ['status'=>1, 'message'=>'OK'];
		
	}
	
	public function add_produit(Request $request)
    {
		$files = $request->file();
		
		$produit = new Produit();
		$produit->produit_nom = $request->nom;
		$produit->categorie_id = $request->categorie;
		$produit->produit_prix = $request->prix;
		$produit->produit_quantite_total = $request->stock;
		$produit->produit_quantite_achete = 0;
		$produit->produit_quantite_restante = $request->stock;
		$produit->produit_date_creation = gmdate('Y-m-d H:i:s');
		
		$produit->save();
		
		$produit_id = $produit->produit_id;
		
		//enregistrer les autres images
		$i = 0;
		if (count($files) > 0) {
            foreach ($files as $file) {
                
                $filename = Stdfn::guidv4() . '.' . $file->extension();
                $file->move(public_path('photos/produits'), $filename);
                
                if($i == 0){
                    //l'image principale
                    $produit->update(['produit_photo_principale'=> $filename]);
                    
                }else{
                    //les autres images
                    $photo = new Photo();
                    $photo->produit_id = $produit_id;
                    $photo->photo_src = $filename;
                    $photo->photo_date_creation = gmdate('Y-m-d H:i:s');
                    $photo->save();
                }
                
                $i++;
                
            }
        }
		
		return ['status'=>1, 'message'=>'OK'];
		
	}
	
	
	public function update_produit(Request $request)
    {
		$files = $request->file();
		$produit_id = $request->produit_id;
		
		$produit = Produit::find($produit_id);
		$produit->produit_nom = $request->nom;
		$produit->categorie_id = $request->categorie;
		$produit->produit_prix = $request->prix;
		$produit->produit_quantite_total = $request->stock;
		$produit->produit_quantite_achete = 0;
		$produit->produit_quantite_restante = $request->stock;
		$produit->produit_date_modification = gmdate('Y-m-d H:i:s');
		
		$produit->exists = true;
		$produit->save();
		
		//enregistrer les autres images
		$i = 0;
		if (count($files) > 0) {
            foreach ($files as $file) {
                
                $filename = Stdfn::guidv4() . '.' . $file->extension();
                $file->move(public_path('photos/produits'), $filename);
                
                if($i == 0){
                    //l'image principale
                    if($produit->produit_photo_principale == "" || !file_exists('http://jobboard.target-ci.com/photos/produits/'.$produit->produit_photo_principale)){
                        $produit->update(['produit_photo_principale'=> $filename]);
                    }
                    
                }
                
                //les autres images
                $photo = new Photo();
                $photo->produit_id = $produit_id;
                $photo->photo_src = $filename;
                $photo->photo_date_creation = gmdate('Y-m-d H:i:s');
                $photo->save();
                
                
                $i++;
                
            }
        }
		
		return ['status'=>1, 'message'=>'OK'];
		
	}
	
	
	public function delete_photo(Request $request)
    {
		$files = $request->file();
		$photo_id = $request->photo_id;
		
		$photo = Photo::find($photo_id);
		$photo->photo_statut = 'SUPPRIME';
		$photo->photo_date_suppression = gmdate('Y-m-d H:i:s');
		
		$photo->exists = true;
		$photo->save();
		
		
		return ['status'=>1, 'message'=>'OK'];
		
	}
	
	
	public function add_commande(Request $request)
    {
        
		$commande = new Commande();
		$commande->client_id = $request->client_id;
		$commande->details = $request->produit_quantite;
		$commande->commande_date_creation = gmdate('Y-m-d H:i:s');
		$commande->save();
		
		$commande_id = $commande->commande_id;
		
        $produits_commandes = $request->produit_quantite;
        
        $tab = explode(',', $produits_commandes);
        
        $total = 0;
        foreach($tab as $t){
            
            $d = explode(':', $t);
            $produit_id = $d[0];
            $quantite = $d[1];
            
            $produit = Produit::find($produit_id);
            
            $pc = new ProduitCommande();
            $pc->commande_id = $commande_id;
            $pc->produit_id = $produit_id;
            $pc->prix_unitaire = $produit->produit_prix;
            $pc->quantite = $quantite;
            $pc->total = $quantite * $produit->produit_prix;
            $pc->save();
            
            $total = $total+ $quantite * $produit->produit_prix;
            
        }
        
        $commande->commande_montant_total = $total;
        $commande->exists = true;
        $commande->save();
        
		return ['status'=>1, 'message'=>'OK'];
		
	}
	
}

