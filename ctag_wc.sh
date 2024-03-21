#wget -L micro.mamba.pm/install.sh
# Run and follow instructions on screen
#bash install.sh
#micromamba env create -f test_env.yml 
#micromamba activate btv_coffea
#pip install -e .
# Arguments: $1=workflow, $2=campaign, $3=year $lumi
#workflow = ttsemilep_sf, ttdilep_sf, ctag_ttdilep_sf, ctag_ttsemilep_sf, ctag_Wc_sf, ctag_DY_sf
# campaign = "Summer22Run3","Summer22EERun3","Summer23","Summer23BPix"
# year = "2022","2023"
# executors = dask, parsl, futures, iterative
python runner.py --json metadata/MC_"$2"_"$3"_BTV_Run3_"$3"_Comm_MINIAODv4_NanoV12.json --workflow $1 --campaign $2 --year $3 --executor $5 --retries 50 -s 1000 -j 10
python runner.py --json metadata/data_"$2"_"$3"_mu_BTV_"$3"_2023_Comm_MINIAODv4_NanoV12.json --workflow $1 --campaign $2 --year $3 --executor $5 --retries 50 -s 1000 -j 10 
python scripts/plotdataMC.py -i hists_"$1"_MC_"$2"_"$3"_BTV_Run3_"$3"_Comm_MINIAODv4_NanoV12/hists_"$1"_MC_"$2"_"$3"_BTV_Run3_"$3"_Comm_MINIAODv4_NanoV12.coffea,hists_"$1"_data_"$2"_"$3"_mu_BTV_Run3_"$3"_Comm_MINIAODv4_NanoV12/hists_"$1"_data_"$2"_"$3"_mu_BTV_Run3_"$3"_Comm_MINIAODv4_NanoV12.coffea --lumi $4 -p "$1" -v all
