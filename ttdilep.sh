#wget -L micro.mamba.pm/install.sh
# Run and follow instructions on screen
#bash install.sh
#micromamba env create -f test_env.yml 
#micromamba activate btv_coffea
#pip install -e .
python runner.py --json metadata/MC_Summer22_2022_BTV_Run3_2022_Comm_MINIAODv4_NanoV12.json --workflow ttsemilep_sf --campaign Summer22Run3 --year 2022 --executor futures --retries 50 -s 1000 --limit 1 --max 1
python runner.py --json metadata/data_Summer22_2022_mu_BTV_Run3_2022_Comm_MINIAODv4_NanoV12.json --workflow ttsemilep_sf --campaign Summer22Run3 --year 2022 --executor futures --retries 50 -s 1000 
python scripts/plotdataMC.py -i hists_ttsemilep_sf_MC_Summer22_2022_BTV_Run3_2022_Comm_MINIAODv4_NanoV12/hists_ttsemilep_sf_MC_Summer22_2022_BTV_Run3_2022_Comm_MINIAODv4_NanoV12.coffea,hists_ttsemilep_sf_data_Summer22_2022_mu_BTV_Run3_2022_Comm_MINIAODv4_NanoV12/hists_ttsemilep_sf_data_Summer22_2022_mu_BTV_Run3_2022_Comm_MINIAODv4_NanoV12.coffea --lumi 8175 -p ttdilep_sf -v all
