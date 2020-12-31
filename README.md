# VineToWine: 
This project is about creating a traceability of wine being produced by a company. This smart contract will create a traceability for a wine bottle for the Vineyard from where teh grapes came to the winery where the grape was processed. All the processes that were conducted while creating the wine to the packing and distributing of the wine bottle. This smart contract will also track change in ownership of the bottle.
# Entities invovled in the eco system:
Any entity which wants to participate in the eco system will need to stake a fixed amount of VineToWine token in roder to register on the platform. This activity calls function registerEntity() in the backend. This function needs entity name and its role in the eco system. Below are various roles in the eco system.
## Farmers:
Any farmer who owns the Vineyard and supplies vines to winery for production can participate by registering on the website.
## Producers:
These are any wineries who produce wine and interacts with Vineyards can register for traceability program.
## Packer:
These are bottlers who recieve the barrell of wine from the producer and bottles and packages the bottle for marketing.
## Distributor:
These are the entity who engages in distribunting the bottles to the retailers.
## Retailer:
Retailers are the end point of sale and deals with direct customers.
## Consumer:
These are consumers of the wine who directly buy form the retaielrs.

# Process invovled in Traceability smart contract:
## Registering the Vineyard:
Once the farmer is registered in the platform they will need to register their Vineyard with the platform. This calls the function registerVineryard() in the background and needs location id of the vineyard and Vine variety to be passed to the function. All the Vineyard locations will be assigned a unique digital id in the eco system (this is beyond the scope of the project, as it will be a separate entity to generate the location id). Vine Variety can be type of grapes used in the Vineyard (gree, red, white, rose).

## Updating the Vineyard details:
In case the farmer wants to change the crop next year then they have flexibility to change the variery of the vine by calling updateVineVariety() which needs location id and vine variety to be passed to the function. This will also reset the indicator of vine being picked for the year and mark it as not picked. This will mean that the vine has been planted again.

## Picking the grapes:
Once the grapes are ready for picking and processing, farmer will need to update the details of the grapes picking and it will call updateVineyardPicking() in the background. This function needs the locaiton id of the vineyard which will udpate teh record that the vineyard has been picked and the time for picking will be udpated.

## Receiving of Vine batch by Producer:
Once the farmer has picked the vine and has delivered it to wine producer, the wine prodicer will need to update the details of the vine batch received by the producer. This will call function receiveVineBatch() in the background. This function needs the batch id of the vine being recevied and the farm id of the farmer from whom the vine is picked.

## Destemming of the grapes:
Now the winery needs to update the timestamp for each of the step invovled in the wine production for traceability. This calls updateDestemming() and use batch number of the Vine used for the process.

## Crushing of the grapes:
Now the winery needs to update the timestamp for each of the step invovled in the wine production for traceability. This calls updateCrushing() and use batch number of the Vine used for the process.

## Chilling of the grapes:
Now the winery needs to update the timestamp for each of the step invovled in the wine production for traceability. This calls updateChilling() and use batch number of the Vine used for the process.

## Pressing of the grapes:
Now the winery needs to update the timestamp for each of the step invovled in the wine production for traceability. This calls updatePressing() and use batch number of the Vine used for the process.

## Putting wine in Barrell:
This captures the details of putting wine in barrell once teh wine is produced for packing. This calls updateBarrell() and use batch number of the Vine used for the process. The output generates a unique barrell number for the wine barrell which is produced and is ready to be sent for packing.

## Receiving of barrell by packer:
Once the producer sends the barrell to packer for bottling, the packer needs to udpate the barrell batch number in the system along with the producer id fr traceability. This calls function receiveBarrell() and needs barrell batch number and producer address as input.

## Bottling of the barrell:
This is the activity where packer will bottle the barrell and make it ready for market. For simplicity i have assumed that one barrel will be packed into one bottle, but in real world there will be multiple bottle for same barrell. This activity will call function updateBottleId() in the backend. This function will take the barrell batch id and bottleid as an input. Bottle id is nothing but the bar code to identify a unique bottle. The generation of bottle id outside of the scope of this smart contract and will be done by external system.

## Changing the bottle owner:
Whenever there is any change in owner after the bottle is packed by the packer to distributor or retailer or to a consumer the history of the change in onwership is tracked. This calls changeOwner() in the background and takes bottle is as an input and is called by the new owner.

## Get bottle history:
This function returns the entire journey of the bottle by calling function getBottleHistory() and takes bottle id as an input. This will return entire journey from teh vineyard details where the grapes was grown to the winery where the wine was produced and all the date when each of the wine processing step was conducted. This will also show when the packed received the wine barell and bottle id. Also, any change in ownership of the bottle after the packer packed it can be traced using this function.

# Tokenomics of the eco system:
Smart contract Token.sol will create the token to be used in the eco system. For simplicity buying and selling of the token is kept out of the scope but smart contract Token.sol will create the token to be used by the entities.
Each of the entitie addresses will then manually approve the smart contract address for VinetoWine.sol to make transfer to specific address while registering themselves on the platform.
This ensures that all the entities have stake in the system and can be trusted. In real world the stake can be higher to ensure there is heavy monetary penalty for faul play. 
Also, any saving in the terms of having the streamline system in place will be distributed to the. entities in terms of dividends based on stake done to the eco system.
