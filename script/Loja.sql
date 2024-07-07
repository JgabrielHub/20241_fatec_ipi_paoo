use loja;



CREATE TABLE cliente (
  codigo INT NOT NULL PRIMARY KEY,  -- Added AUTO_INCREMENT for unique IDs
  nome VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL UNIQUE,             -- Ensured email uniqueness
  senha VARCHAR(255) NOT NULL,                    -- Increased password length for security
  telefone VARCHAR(15) NOT NULL,
  documento VARCHAR(12) NOT NULL UNIQUE,          -- Ensured document uniqueness (e.g., CPF)
  cep VARCHAR(10) NOT NULL,
  cidade VARCHAR(25) NOT NULL,
  estado CHAR(2) NOT NULL,                         -- Maintained state as CHAR(2) for brevity
  logradouro VARCHAR(255) NOT NULL,               -- Increased address length
  complemento VARCHAR(255)                         -- Increased complement length
);
create table pedido (
	codigo INT NOT NULL PRIMARY KEY,
   codigoCliente int NOT NULL,
   total double NOT NULL,
   status Varchar(25) NOT NULL,
	entrega VARCHAR(255) NOT NULL,
    dataPedido Datetime NOT NULL,
    
    FOREIGN KEY (codigoCliente) REFERENCES cliente(codigo)
);
CREATE TABLE produto (
  codigo INT NOT NULL PRIMARY KEY,  -- Added AUTO_INCREMENT for unique IDs
  nome VARCHAR(255) NOT NULL,
  descritivo VARCHAR(560) NOT NULL,
  valor DECIMAL(10,2) NOT NULL,                    -- Ensured decimal format for price
  promo DECIMAL(10,2),                             -- Decimal format for promo (optional)
  estoque INT NOT NULL
);

insert into produto values (1,'Samsung Galaxy S23 FE 5G Dual SIM 128 GB Grafite 8 GB RAM',
'Memória RAM: 8 GB
Dispositivo desbloqueado para que você escolha a companhia telefônica de sua preferência.
Compatível com redes 5G. Tela de 6.4". Memória interna de 128GB.
Resistente à água e poeira com a classificação IP68',
3.999,2699,350);

insert into produto values (2,'Apple iPhone 14 (128 GB) – Meia-Noite',
'Marca	Apple
Sistema operacional	iOS
Capacidade de armazenamento da memória	128 GB
Tamanho da tela	6,1 Polegadas
Nome do modelo	iPhone 14',
4311,3899,50);
insert into produto values (3,'Samsung Smart TV 50 QLED 4K 50Q60D',
'Tamanho da tela 50 Polegadas Marca SAMSUNG Tecnologia do visor	4k Resolução 4K
Taxa de atualização	60 Hz
Dimensões do produto 22,4P x 111,8L x 76,1A centímetros
Cor	preto grafite
',2638,2400,350);

insert into produto values(4,'Smart TV 50" 4K LG UHD ThinQ AI',
'Smart - LG ThinQ AI Google Assistente - Amazon Alexa - Airplay2 & Homekit - 
Painel de Controle Alerta de Esportes - Processamento Natural de Linguagem AI Recommendation - 
Controle Smart Magic - Otimizador de Games - LG Channels Edição Inteligente de Apps Media Player - WebOS23',
2799,
2295,
650);
insert into produto values(5,'PlayStation®5 Standard Edition',
'Jogar Não Tem Limites PlayStation5 O console PS5 oferece novas possibilidades de jogabilidade que você nunca imaginou. 
Reproduza jogos para PS5 e PS4 em Blu-ray Disc. 
Além disso, você também pode baixar jogos digitais para PS5 e PS4 pela PlayStation Store. 
Experimente o carregamento extremamente rápido do SSD de ultra-velocidade, 
uma imersão mais profunda com suporte à resposta tátil, gatilhos adaptáveis e áudio 3D. 
Além de uma geração totalmente nova de jogos incríveis PlayStation.',
4499.90,
3599.90,
150);
insert into produto values(6,'Notebook Samsung Galaxy Book2 Intel Core i5-1235U, 8GB RAM, Ssd 256GB','
Marca	SAMSUNG
Nome do modelo	NP550XED-KF2BR
Tamanho da tela	15.6
Cor	Grafite
Tamanho do disco rígido	256 GB
Modelo da CPU	Core i5-1235U
Tamanho instalado da memória RAM	8 GB
Sistema operacional	Windows 11 Home
Características especiais	Tela 15.6" Full HD LED antirreflexiva
Descrição da placa de vídeo',3679,2907,60);
insert into produto values (7,'Notebook Dell Inspiron',
'
Marca	Dell
Nome do modelo	Inspiron 15
Tamanho da tela	15,6 Polegadas
Cor	preto
Modelo da CPU	Intel Core i3
Tamanho instalado da memória RAM	8 GB
Sistema operacional	Windows 11
Características especiais	Teclado Numérico
Descrição da placa de vídeo	Integrado
Velocidade da CPU',
2650,2450,350);

insert into produto values (8,'Apple iPhone 13 512GB Meia-noite Tela 6,1” 12MP',
'Tela Super Retina XDR de 6,1 polegadas
O modo cinematic adiciona profundidade de campo rasa e muda o foco automaticamente em seus vídeos
Sistema avançado de câmera dupla com câmeras Wide e Ultra Wide de 12MP; Estilos fotográficos, Smart HDR 4, modo noturno, gravação 4K Dolby Vision HDR
Câmera frontal TrueDepth de 12 MP com modo noturno, gravação 4K Dolby Vision HDR
Chip biônico A15 para desempenho ultrarrápido',
5799.99,
5219.99,60);

insert into produto values (9,'Smartphone Samsung Galaxy A14, 128gb, 4gb Ram C/ Nf-e','128GB de Memória Interna(*) e 4GB RAM
Bateria de 5000mAh
Câmera Tripla Traseira de 50MP +5MP + 2MP Selfie de 13.0 MP
Tela Infinita de 6.6"** 60Hz
Dual Chip, Dual Messenger',1599,1179,190);
insert into produto values (10,'Smartphone Xiaomi Redmi 12 4G 256 GB, 8 GB de RAM, Midnight Black
','Tecnologia de conexão: Wifi
Tamanho da tela: 6,79 polegadas
Capacidade de armazenamento da memória: 256 GB
Sistema operacional: Android
Tecnologia de rede sem fio: CDMA',1035,926,55);
insert into produto values (11,'Samsung Smart TV 58" UHD 4K 58CU7700','Característica especial: Plana
Método de controle: controle remoto
Dimensões do item: 0,0 polegadas
Tela. Tamanho: 58,0 polegadas',2789,2394,60);

insert into produto values (12,'Smartphone Motorola Moto G54 5G, 256GB, 8GB RAM, Câmera 50MP, Selfie 16MP, Tela 6.5 Polegadas, Azul','Tela imersiva FHD+ e Dolby Atmos
Câmera de 50 MP + OIS
Velocidade 5G
Superbateria e carregamento TurboPower
Bastante armazenamento interno',1090,920,30);
insert into produto values (13,'Tab S9+ Grafite, 512GB 12.4','Marca	SAMSUNG
Nome do modelo	S9+
Capacidade de armazenamento da memória	512 GB
Tamanho da tela	12.4
Resolução máxima do visor	2800 x 1752 Pixels',5159,4700,240);

insert into produto values (14,'Xiaomi Redmi Pad SE 11" 8GB/256GB (Cinza)
','Alto-falantes estéreo quádruplos com suporte para Dolby Atmos'
,1599,1379,90);

insert into produto values (15,'Smart TV 43" 4K LG UHD ThinQ AI 43UR7800PSA HDR Bluetooth Alexa Google Assistente Airplay2 3 HDMI'
,'Smart - LG ThinQ AI
Google Assistente & Amazon Alexa
Airplay2 & Homekit
Painel de Controle Alerta de Esportes
Processamento Natural de Linguagem AI Recommendation
Otimizador de Games
LG Channels Edição Inteligente de Apps Media Player
FreeSync - WebOS23',
2849,1964,150);


insert into produto values (16,'Fone De Ouvido Bluetooth Jbl Tune 500bt Sem Fio - Preto',
'Marca	JBL
Cor	Preto
Fator de forma dos fones de ouvido	Sobre a orelha
Tecnologia de conectividade	Sem fio
Tecnologia de comunicação sem fio	Bluetooth',270,0,900);


insert into produto values (17,'Fone de Ouvido - Bluetooth - QCY T1C - 2020 - Preto','
Marca	QCY
Cor	Preto
Colocação na orelha	Intra-auriculares
Fator de forma dos fones de ouvido	Dentro da orelha
Impedância	32 Ohm',89,0,500);

insert into produto values (18,'Console Nintendo Switch',
'UM NOVO MUNDO DE POSSIBILIDADES. Os modos TV, semiportátil e portátil, permitem que você embarque nos mundos das suas franquias favoritas, com muita versatilidade. Se adaptando às suas necessidades, o Nintendo Switch é um console portátil e doméstico.',
1999,0,500);

insert into produto values (19,'Fones de Ouvido JBL Wave Buds – Preto
','Som JBL Depp bass/ Bateria de até 32 horas (8 horas no fone+ 24 no estojo de transporte)/ Controle Touch/IP54: Resistente à poeira e respingos de água(fones) IPX2 (estojo de carregamento)/ Viva voz / Carga rápida 10 minutos = 2 horas)/ Tecnologia Smart Ambient/ Acesso ao aplicativo JBL Headphones/Formato bud fechado1 ano com o fabricante
Cor do produto: Preto',239,226,390);

insert into produto values (20,'Tablet Xiaomi Redmi Mi Pad 6 128GB - 6GB Ram (Versao Global) (Mist Blue)',
'Cor: Mist Blue
Marca	Xiaomi
Nome do modelo	Tablet Xiaomi Pad 6 6 GB RAM 128 GB ROM
Tamanho da tela	11 Polegadas
Resolução máxima do visor	2880 x 1800 Pixels
Sistema operacional	Android 13',
3999,
3799,
90);

insert into produto values (21,'Câmera Digital EOS, Canon, Preto, 23 x 14 x 17 cm',
'11 funções personalizadas com 33 definições ajustáveis com a câmera, Cena Automática Inteligente e Estilo de Imagem Automático
Compatível com a linha completa de lentes EF/EF-S e flashes Speedlite da Canon
Gravação simultânea em RAW + JPEG, Live View Mode, Correção da iluminação periférica
',
3899,
0,0);
insert into produto values (22,'PC Completo Intel Pentium 1155, 8GB RAM DDR3, 
HD 500GB + SSD 120GB, Monitor 18,5" LED, 
Teclado, Mouse e Wi-Fi de','Marca	Chip7 Informática
Sistema operacional	Windows 10 Pro
Modelo da CPU	Pentium
Tamanho instalado da memória RAM	8 GB',1.999,0,0);
insert into produto values (23,'Computador Intel Core i5 8GB SSD 256GB 4 
Núcleos Super Turbo Pc Hdmi Teclado e Mouse Strong Tech',
'Processador Intel Core i5 Super Turbo
Memória RAM 8GB DDR3
SSD 256GB
Teclado e Mouse USB
Windows 10 Trial
Será enviado gabinete de acordo com a disponibilidade em estoque',972,0,50);
insert into produto values (24,
'PC Gamer ITX Arena Setup Powered By Asus, 
I5 10400F, Asus GTX 1650 4GB, 16GB, SSD 480GB',
'Aqui na ITX GAMER fabricamos aquilo em que confiamos! Powered By Asus, Domine com o Melhor!
Intel Core i5 10400F de 10ª Geração
Placa mãe H510
SSD SATA III 480GB, Desempenho Garantido!
2x Memórias Gamer 8GB, (2x8GB) 3000MHz, DDR4',
3499,0,350);
insert into produto values (25,'PC Gamer Mancer, Ryzen 7 5700G, Vega 8, 
16GB DDR4, SSD 120GB, Fonte 500W 80 Plus','',9,9,0);

insert into produto values (26,'JBL Caixa de Som, Boombox 3, Bluetooth, À Prova Dágua e Poeira - Preto',
'A CAIXA MAIS PODEROSA. A Boombox 3 possui uma silhueta icônica, tampas laterais duplas e 
tecido exclusivo à prova dágua e poeira.',3199.00,2175,50);

insert into produto values (27,'Monitor Gamer AOC SPEED 24 75Hz IPS 1ms 24G2HE5',
'Desenvolvido para suportar todas as emoções dos seus jogos, o incrível tempo de resposta de 1ms oferece alta velocidade,
 definição e muita suavidade em todos os seus movimentos.',764,0,50);

insert into produto values (28,'Xbox Series S Nova Geração 512GB SSD - 1 Controle Branco Microsoft
','Xbox Series S, nosso Xbox menor e mais elegante de todos os tempos. 
Com taxas de quadros mais altas, tempos de carregamento mais rápidos e mundos mais ricos e dinâmicos, 
o Xbox Series S oferece desempenho e velocidade de última geração em um formato compacto e totalmente digital.',3399.9,0,360);

insert into produto values (29,'Echo Dot 5ª geração | O Echo Dot com o melhor som já lançado | Cor Preta',
'O ECHO DOT COM O MELHOR SOM JÁ LANÇADO - Curta uma experiência sonora ainda melhor em comparação às versões anteriores do Echo Dot com Alexa 
e ouça vocais mais nítidos, graves mais potentes e um som vibrante em qualquer ambiente.',
346,0,60);

insert into produto values (30,'Apple AirPods (3ª geração) com estojo de recarga Lightning ​​​​​​​'
,'Microfones duplos beamforming, sensor de força, microfone voltado para dentro,
acelerômetro de detecção de movimento, sensores de detecção de pele, acelerômetro de detecção de fala
Até 6 horas de tempo de audição com uma única carga, com estojo de carregamento Lightning: até 30 horas de tempo de audição, 
até 20 horas de tempo de conversação, 5 minutos no estojo fornecem cerca de 1 hora de tempo de 
audição ou cerca de 1 hora de tempo de conversação',
1899,1529,60);

insert into produto values (31,'QCY H3 ANC Fone de Ouvido Bluetooth, Headphone com Cancelamento de Ruido, Hi-Res Audio, 60 horas Reprodução, Branco',
'Os cinco microfones instalados nos fones de ouvido detectam o ruído ambiente e reduzem o ruído em até -43dB com cancelamento de ruído ativo (ANC). 
Mesmo em ambientes ruidosos, o modo ANC adaptativo ajusta-se automaticamente ao ruído ambiente, permitindo-lhe desfrutar de música confortavelmente.',
239,0,120);

insert into produto values (32,'Caixa de Som JBL Partybox 110 Bluetooth - Portátil Amplificada 160W',
'Comece uma festa com um som poderoso e um show de luzes dinâmico com a caixa de som JBL Partybox 110. Do tipo portátil e amplificada,
 ela tem conectividade via Bluetooth, 160W RMS de potência e conexões como RCA L/R, porta USB, entrada auxiliar de 3,5mm, 
microfone/guitarra/violão com controle de volume.
 Leve uma dimensão totalmente nova para qualquer festa com as exclusivas luzes dinâmicas de LED,
 sincronizadas com o som poderoso e graves profundos. ',3099,2249,50);

insert into produto values (33,'Apple iPhone 12 (128 GB) - Branco',
'Tela Super Retina XDR de 6,1 polegadas
Ceramic Shield. Mais resistente do que qualquer vidro de smartphone
A14 Bionic, o processador mais rápido de sempre num smartphone
Sistema de câmara dupla avançado de 12 MP (Ultra grande angular e Grande angular) com modo Noite, Deep Fusion, HDR inteligente 3, gravação em HDR 4K Dolby Vision
Câmara frontal TrueDepth de 12 MP com modo Noite, gravação em HDR 4K Dolby Vision',
6999,0,80);

insert into produto values (34,'Smartphone Xiaomi Redmi Note 13 8+256G Powerful Snapdragon® 
performance 120Hz FHD+ AMOLED display 33W fast charging with 5000mAh battery No NFC (Black)',
'33W fast charging with 5000mAh battery
Powerful Snapdragon performance
Secure in-screen fingerprint sensor
120Hz FHD+ AMOLED display
Super-clear 108MP triple camera
Immersive viewing with ultra-thin bezels',1549,1195,80);

insert into produto values (35,'Samsung Galaxy M34 5G 128GB 6GB RAM',
'Samsung Galaxy M34 5G 128GB 6GB RAM Mega Bateria 6000mAh Câmera Tripla 50MP+8+2 OctaCore 6.5" 120Hz Prata',
1210,1100,50);


insert into produto values (36,'HyperX HEADSET CLOUDX XBOX SERIES X AND S BLACK, One Size',
'Fone de ouvido oficial licenciado pela Xbox: o CloudX foi testado pela Microsoft e funciona com controles Xbox 
que têm um conector de fone de ouvido de 3,5 mm.',
499,0,220);


select * from produto;
select * from cliente;
select* from pedido;
