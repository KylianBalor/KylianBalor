
-- Menu --
local open = false 
local Astuce = RageUI.CreateMenu('Astuce', 'Interaction')
local AstuceTouche = RageUI.CreateSubMenu(Astuce, "Touches", "Interaction")
local AstuceCommande = RageUI.CreateSubMenu(Astuce, "Commandes", "Interaction")
local AstuceUtilitaire = RageUI.CreateSubMenu(Astuce, "Utilitaires", "Interaction")
Astuce.Display.Header = true 
Astuce.Closed = function()
  open = false
end

function OpenAstuceMenu()
	if open then 
		open = false
		RageUI.Visible(Astuce, false)
		return
	else
		open = true 
		RageUI.Visible(Astuce, true)
		CreateThread(function()
		while open do 
		   RageUI.IsVisible(Astuce,function() 

			RageUI.Separator("Connecté en tant qu'id [~b~"..GetPlayerServerId(PlayerId()).."~s~]")
			RageUI.Separator("↓ ~b~   Astuce   ~s~↓")
			RageUI.Button("Touche", "Ouvrir le menu des touches", {RightLabel = "→→→"}, true , {}, AstuceTouche)

			RageUI.Button("Commande", "Ouvrir le menu des commandes", {RightLabel = "→→→"}, true , {}, AstuceCommande)

			RageUI.Button("Utilitaire", "Ouvrir le menu des utilitaires", {RightLabel = "→→→"}, true , {}, AstuceUtilitaire)

			RageUI.Separator("↓ ~b~   Fermer   ~s~↓")
			RageUI.Button("~r~Fermer", "Fermer le menu", {RightLabel = "→→"}, true , {
				onSelected = function()
					RageUI.CloseAll()
				end
			})
			end)

			-- Menu Astuce touche
			RageUI.IsVisible(AstuceTouche,function() 
			
			RageUI.Separator("↓ ~b~   Touches   ~s~↓")
			RageUI.Button("F5", "Menu pricipale", {RightLabel = ""}, true , {})

			RageUI.Separator("↓ ~b~   Fermer   ~s~↓")
			RageUI.Button("~r~Fermer", "Fermer le menu", {RightLabel = "→→"}, true , {
				onSelected = function()
					RageUI.CloseAll()
				end
			})
			end)

			-- Menu Astuce commande
			RageUI.IsVisible(AstuceCommande,function() 

			RageUI.Separator("↓ ~b~   Commandes   ~s~↓")
			RageUI.Button("/help", "Ouvre le menu astuce", {RightLabel = ""}, true , {})

			RageUI.Separator("↓ ~b~   Fermer   ~s~↓")
			RageUI.Button("~r~Fermer", "Fermer le menu", {RightLabel = "→→"}, true , {
				onSelected = function()
					RageUI.CloseAll()
				end
			})
			end)
	
			-- Menu Astuce utilitaire
			RageUI.IsVisible(AstuceUtilitaire,function() 
	
			RageUI.Separator("↓ ~b~   Utilitaires   ~s~↓")
			RageUI.Button("Discord", "Vous envois le lien du discord", {RightLabel = "→"}, true , {
				onSelected = function()
					TriggerServerEvent('dprAstuce:discord')
				end
			})

			RageUI.Separator("↓ ~b~   Fermer   ~s~↓")
			RageUI.Button("~r~Fermer", "Fermer le menu", {RightLabel = "→→"}, true , {
				onSelected = function()
					RageUI.CloseAll()
				end
			})
			end)
		Wait(0)
		end
	 end)
  end
end

-- Message --
RegisterNetEvent('dprAstuce:discord')
AddEventHandler('dprAstuce:discord', function(car)
    -- Notification
    ESX.ShowAdvancedNotification("Astuce", "Utilitaire", "Voici le lien du discord: ~b~https://discord.gg/kY4FAG8ADB", "CHAR_JOSH", 1)
end)

----OUVRIR LE MENU------------
local position = {
	{x = -1037.75, y = -2737.95, z = 20.16}
}

Citizen.CreateThread(function()
    while true do
		local wait = 750

			for k in pairs(position) do
			local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
			local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

			if dist <= 5.0 then
			wait = 0
			DrawMarker(32, -1038.11, -2738.51, 20.16, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 255, 0, 0 , 255, true, true, p19, true)  

			if dist <= 5.0 then
			wait = 0
				Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour ouvrir le menu des astuces !", 1) 
				if IsControlJustPressed(1,51) then
					OpenAstuceMenu()
				end
			end
		end
    Citizen.Wait(wait)
    end
end
end)

RegisterCommand("help", function(source, args, rawcommand)
    OpenAstuceMenu()
end, false)

DecorRegister("Desperados", 4)
pedHash = "csb_reporter"
zone = vector3(-1037.75, -2737.95, 19.16)
Heading = 148.5
Ped = nil
HeadingSpawn = 148.5

Citizen.CreateThread(function()
    LoadModel(pedHash)
    Ped = CreatePed(2, GetHashKey(pedHash), zone, Heading, 0, 0)
    DecorSetInt(Ped, "Desperados", 5431)
    FreezeEntityPosition(Ped, 1)
    TaskStartScenarioInPlace(Ped, "WORLD_HUMAN_COP_IDLES", 0, false)
    SetEntityInvincible(Ped, true)
    SetBlockingOfNonTemporaryEvents(Ped, 1)
    end)

function LoadModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Wait(1)
    end
end