apt update
apt install -y aria2
apt-get install python3-pip
apt install vim
apt-get install tmux

pip3 install -r requirements.txt

git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
git reset --hard 394ffa7
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/embed/upscale/resolve/main/4x-UltraSharp.pth -d ./stable-diffusion-webui/models/ESRGAN -o 4x-UltraSharp.pth
wget https://raw.githubusercontent.com/camenduru/stable-diffusion-webui-scripts/main/run_n_times.py -O ./stable-diffusion-webui/scripts/run_n_times.py
git clone https://github.com/camenduru/stable-diffusion-webui-images-browser ./stable-diffusion-webui/extensions/stable-diffusion-webui-images-browser
git clone https://github.com/camenduru/sd-civitai-browser ./stable-diffusion-webui/extensions/sd-civitai-browser
git clone https://github.com/kohya-ss/sd-webui-additional-networks ./stable-diffusion-webui/extensions/sd-webui-additional-networks
git clone https://github.com/Mikubill/sd-webui-controlnet ./stable-diffusion-webui/extensions/sd-webui-controlnet
git clone https://github.com/camenduru/sd-webui-tunnels ./stable-diffusion-webui/extensions/sd-webui-tunnels
git clone https://github.com/etherealxx/batchlinks-webui ./stable-diffusion-webui/extensions/batchlinks-webui
git clone https://github.com/camenduru/stable-diffusion-webui-catppuccin ./stable-diffusion-webui/extensions/stable-diffusion-webui-catppuccin
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui-rembg ./stable-diffusion-webui/extensions/stable-diffusion-webui-rembg
git clone https://github.com/ashen-sensored/stable-diffusion-webui-two-shot ./stable-diffusion-webui/extensions/stable-diffusion-webui-two-shot
git clone https://github.com/thomasasfk/sd-webui-aspect-ratio-helper ./stable-diffusion-webui/extensions/sd-webui-aspect-ratio-helper
git clone https://github.com/nonnonstop/sd-webui-3d-open-pose-editor ./stable-diffusion-webui/extensions/sd-webui-3d-open-pose-editor
git clone https://github.com/continue-revolution/sd-webui-segment-anything.git ./stable-diffusion-webui/extensions/sd-webui-segment-anything

aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/resolve/main/control_v11p_sd15_openpose_fp16.safetensors -d ./stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_v11p_sd15_openpose_fp16.safetensors
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/resolve/main/control_v11f1e_sd15_tile_fp16.safetensors -d ./stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_v11f1e_sd15_tile_fp16.safetensors
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/raw/main/control_v11p_sd15_openpose_fp16.yaml -d ./stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_v11p_sd15_openpose_fp16.yaml
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/ControlNet-v1-1/raw/main/control_v11f1e_sd15_tile_fp16.yaml -d ./stable-diffusion-webui/extensions/sd-webui-controlnet/models -o control_v11f1e_sd15_tile_fp16.yaml

aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://j-shine-ai.oss-cn-chengdu.aliyuncs.com/xinggeai3.ckpt -d ./stable-diffusion-webui/models/Stable-diffusion -o xinggeai3.ckpt
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.ckpt -d ./stable-diffusion-webui/models/Stable-diffusion -o xinggeai3.vae.pt
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://j-shine-ai.oss-cn-chengdu.aliyuncs.com/cartoonid_v2.0.safetensors -d ./stable-diffusion-webui/models/Lora -o cartoonid_v2.0.safetensors

aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/datasets/gsdf/EasyNegative/resolve/main/EasyNegative.pt -d ./stable-diffusion-webui/embeddings -o EasyNegative.pt
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/nick-x-hacker/bad-artist/resolve/main/bad-artist.pt -d ./stable-diffusion-webui/embeddings -o bad-artist.pt
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/embed/negative/resolve/main/bad-hands-5.pt -d ./stable-diffusion-webui/embeddings -o bad-hands-5.pt
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/embed/negative/resolve/main/ng_deepnegative_v1_75t.pt -d ./stable-diffusion-webui/embeddings -o ng_deepnegative_v1_75t.pt
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/embed/negative/resolve/main/EasyNegativeV2.safetensors -d ./stable-diffusion-webui/embeddings -o EasyNegativeV2.safetensors

sed -i -e '/    api = create_api/a\' -e '    modules.script_callbacks.before_ui_callback()' ./stable-diffusion-webui/webui.py
sed -i -e 's/\"sd_model_checkpoint\"\,/\"sd_model_checkpoint\,sd_vae\,CLIP_stop_at_last_layers\"\,/g' ./stable-diffusion-webui/modules/shared.py

cd ./stable-diffusion-webui
apt install python3.10-venv
python3.10 -m venv venv
