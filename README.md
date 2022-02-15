# nft-mix Basado en el repo de Patrick Collins

En este repositorio vamos a desplegar un contrato inteligente de NFT para crear una colección de mascotas

## Prerequisitos

Por favor instale o tenga instalado lo siguiente:

- [nodejs y npm](https://nodejs.org/en/download/)
- [python](https://www.python.org/downloads/)
## Instalación

1. [Instalar brownie](https://eth-brownie.readthedocs.io/en/stable/install.html), sino lo haz hecho, esta es una forma sencilla de hacerlo.


```bash
pip install eth-brownie
```
Sino funciona podrias hacerlo via pipx
```bash
pip install --user pipx
pipx ensurepath
# restart your terminal
pipx install eth-brownie
```

2. Clone este repo 
```
https://github.com/camohe90/nft-mix
cd nft-mix
```

3. [Instala ganache ganache-cli](https://www.npmjs.com/package/ganache-cli)

```bash
npm install -g ganache-cli
```
4. Instala los contratos de openzeppelin

```bash
npm install @openzeppelin/contracts
```
Si quieres desplagar el NFT en una red de pruebas debes hacer lo siguiente

5. Configura las variables de entorno

Configura tus [variables de entorno](https://www.twilio.com/blog/2017/01/how-to-set-environment-variables.html) `WEB3_INFURA_PROJECT_ID`, y `PRIVATE_KEY` . 

Puedes obtener un `WEB3_INFURA_PROJECT_ID` creando una cuenta en [Infura](https://infura.io/). Creas un nuevo proyecto y seleccionas la red de pruebas rinkeby. 

En cuanto a tu `PRIVATE_KEY` las puedes obtener de una wallet como [metamask](https://metamask.io/). 

Tambien vas a necesitar ETH rinkeby de prueba. Puedes obtener ETH usando el siguiente [faucet de rinkeby en el siguiente enlace](https://faucets.chain.link/rinkeby). Si eres nuevo por favor, [mira este video.](https://www.youtube.com/watch?v=P7FX_1PePX0)

Puedes agregar tus variables de entorno en el archivo `.env`:

```
export WEB3_INFURA_PROJECT_ID=<PROJECT_ID>
export PRIVATE_KEY=<PRIVATE_KEY>
```

Luego, debes estar seguro que tu archivo `brownie-config.yaml` tenga:

```
dotenv: .env
```

# Uso

Se puede hacer el despliegue en la red de pruebas rinkeby para mostar los NFTS, pero se recomienda que se hagan pruebas y despliegue en la red local, así no es necesario esperar a que las transacciones se procesem

# Ejecute los siguientes comandos.
```
brownie run scripts/simple_collectible/deploy_simple.py --network rinkeby
brownie run scripts/simple_collectible/create_collectible.py --network rinkeby
```

# Modificar la metadata

Por defecto el script usa la metadata del archivo JSON que se cargo en Pinata y se pasa como parametro en create_collectible en la linea 5.

Pero si quisieras subir tus propias imagenes debes subirlas a Pinata y modificar la plantilla que se encuentra en la carpeta metadata/rinkeby/demo.json, ahi solo debes reemplazar la URL de image por la de la imagen que hayas subido a Pinata.

Ese archivo JSON los debes subir a Pinata y por cada collecionable que desees crear debes crear manualmente (por ahora) un archivo JSON

Por ultimo debes reemplazar la URL de nuevo JSON en el script create_collectible en la linea 5.

## Recursos

Para empezar con brownie:

* [Documentación de Chainlink ](https://docs.chain.link/docs)
* Revisa la [documentación de Chainlink](https://docs.chain.link/docs) para empezar to get started from any level of smart contract engineering. 
* Puedes revisar los otros [Brownie mixes](https://github.com/brownie-mix/) que pueden ser usado como punto de partida para tus propios contratos. Allí encontraras ejemplos para emepzar como.
* ["Getting Started with Brownie"](https://medium.com/@iamdefinitelyahuman/getting-started-with-brownie-part-1-9b2181f4cb99) es un buen tutorial para que te familiarices con Brownie.
* Para más información especificoa, puedes revisar la [documentación Brownie](https://eth-brownie.readthedocs.io/en/stable/).

## Licencia

This project is licensed under the [MIT license](LICENSE).
Fork del repositorio de https://github.com/PatrickAlphaC

## Contribuidores
@camohe90
@djmendez-coding
