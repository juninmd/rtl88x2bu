# Instalação

## Adaptador WiFi D-Link, AC1200, Dual-Band, 5GHz 802.11ac, USB 3.0 - DWA-182 (LINUX)

Confere se é esse o aparelho
```bash
lsusb -v -d 0bda:b812
```

Instala o básico
```bash
sudo apt-get install build-essential dkms git

```

Clona esse repositório
```bash
git clone https://github.com/juninmd/rtl88x2bu.git
```

Entra no repo
```bash
git clone https://github.com/juninmd/rtl88x2bu.git
sudo make
sudo make install
sudo modprobe 88x2bu
```
E é isso, tá com a internet ON

Créditos:
https://www.youtube.com/watch?v=NGbaeZqZoc8&list=LL&index=1&t=79s
