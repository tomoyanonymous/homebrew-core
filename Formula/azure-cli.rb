class AzureCli < Formula
  desc "Microsoft Azure CLI 2.0"
  homepage "https://docs.microsoft.com/cli/azure/overview"
  url "https://azurecliprod.blob.core.windows.net/releases/azure-cli-2.0.26.tar.gz"
  sha256 "3d49bf2cac972f441d4b78e1ea38ba43f18a3568fb5799eb3aa920551ccd6965"
  head "https://github.com/Azure/azure-cli.git"

  bottle do
    cellar :any
    sha256 "0a1f7e69863cf9d5fd21fa6b27aac3625257073e338ac294073ae8b632a6a906" => :high_sierra
    sha256 "a67e3211b6f11733a9b77a66dd473b4fb4a12a64b17bdd9c0f9158dfe8d60637" => :sierra
    sha256 "6ce384a7ca7c311333260e694f275931b2f62ec134389898ef3869c583cafed9" => :el_capitan
  end

  depends_on "openssl"
  depends_on "python3"

  resource "adal" do
    url "https://files.pythonhosted.org/packages/cf/5c/3accec764163386982817edcd4fbefd0bd6ce5c2ced3fedc3f548a47a526/adal-0.5.0.tar.gz"
    sha256 "120821f72ca9d59a7c7197fc14d0e27448ff8d331fae230f92d713b9b5c721f7"
  end

  resource "applicationinsights" do
    url "https://files.pythonhosted.org/packages/85/8e/0a35471fc38b9127df372f4e442ab4c90cf42e0dbc13bbe0944c30f34da8/applicationinsights-0.11.1.tar.gz"
    sha256 "a580794a66da1cd3b66ee5f3293b2d644c279e61ef60f2f38a5cc3af51354945"
  end

  resource "argcomplete" do
    url "https://files.pythonhosted.org/packages/8b/54/4a431fe1dfac0d9ae9adc725d2fe543fad07fb7d87f15bd732ba63672bb4/argcomplete-1.9.3.tar.gz"
    sha256 "d97b7f3cfaa4e494ad59ed6d04c938fc5ed69b590bd8f53274e258fb1119bd1b"
  end

  resource "asn1crypto" do
    url "https://files.pythonhosted.org/packages/fc/f1/8db7daa71f414ddabfa056c4ef792e1461ff655c2ae2928a2b675bfed6b4/asn1crypto-0.24.0.tar.gz"
    sha256 "9d5c20441baf0cb60a4ac34cc447c6c189024b6b4c6cd7877034f4965c464e49"
  end

  resource "azure-batch" do
    url "https://files.pythonhosted.org/packages/4e/24/b6764cbb01ea09a1a8f464869ecc926cbc1d4e6dca580b2d16c974e41449/azure-batch-4.0.0.zip"
    sha256 "35c617cb601dd286ea6d078f95e0c6b159b4c7974ed6f3693c6dffd2513285af"
  end

  resource "azure-batch-extensions" do
    url "https://files.pythonhosted.org/packages/32/ee/27896a170b84c4aee99d5d111490e186e45e797ec158d1f303cfd8b65683/azure-batch-extensions-1.0.1.tar.gz"
    sha256 "e35414a2ef18e4525b0841bff32eba268dc2f863c69891bab3aaccb444d898cc"
  end

  resource "azure-common" do
    url "https://files.pythonhosted.org/packages/85/76/8809248c38bf1c994f40bc07cf3a17dec0aa00ba0915f159c904b040893e/azure-common-1.1.8.zip"
    sha256 "25559617b41fe0902f34b215a3440a3ffa4862fe442bf351415be0e1d2eb4289"
  end

  resource "azure-datalake-store" do
    url "https://files.pythonhosted.org/packages/e1/ab/72c7c42220a6d881316bfbc4b1eace2ae37e6c291ccd13d6ae178fe388bd/azure-datalake-store-0.0.17.tar.gz"
    sha256 "9ff88f7e5ec58080155350fd23b9fc2b7f30bf7dda0b6e7397dde949d97937b7"
  end

  resource "azure-graphrbac" do
    url "https://files.pythonhosted.org/packages/33/0f/9bbc92a4566986a3f1de311e95cd5a1c6ba473783d2c9381be38d1f9d946/azure-graphrbac-0.31.0.zip"
    sha256 "faa7d632f13d5f99a704c561dca0711aa72f9b48b3494075c3d5a9f76734d61e"
  end

  resource "azure-keyvault" do
    url "https://files.pythonhosted.org/packages/10/92/24d4371d566f447e2b4ecebb9c360ca52e80f0a3381504974b0e37d865e7/azure-keyvault-0.3.7.zip"
    sha256 "549fafb04e1a3af1fdc94ccde05d59180d637ff6485784f716e7ddb30e6dd0ff"
  end

  resource "azure-mgmt-advisor" do
    url "https://files.pythonhosted.org/packages/48/a8/5efd0bbeaa5cd64535f0e2dff8d6823d47e0ea1b421808351e06ceb25ca6/azure-mgmt-advisor-0.1.0.zip"
    sha256 "c72932946258f080830fafb77a3bef6e6637e249c7249c178da7be8041cdc287"
  end

  resource "azure-mgmt-authorization" do
    url "https://files.pythonhosted.org/packages/27/ed/e857a8d638fe605c24ca11fe776edad2b0ff697e2395fff25db254b37dfb/azure-mgmt-authorization-0.30.0.zip"
    sha256 "ff965fe74916974a51e834615b7204f494a1bad42ad8d43874bd879855554466"
  end

  resource "azure-mgmt-batch" do
    url "https://files.pythonhosted.org/packages/de/27/910b77c194c1e88f7e50dbb1132ed8afd834636bb5e2daf65c33caded215/azure-mgmt-batch-4.1.0.zip"
    sha256 "2e69f407dc8a94d87316ee6a82b6f3c1d6997b84e337042c3c4ed6450adcd359"
  end

  resource "azure-mgmt-batchai" do
    url "https://files.pythonhosted.org/packages/5c/e7/d29acdca0136c9e74cfcf8d78a12e9f890f77a66b375de7351f95dd2015e/azure-mgmt-batchai-0.2.0.zip"
    sha256 "35bda8468cedd0da03841789d96386f2d06d3789e53df72d9b620ac44e6b6f80"
  end

  resource "azure-mgmt-billing" do
    url "https://files.pythonhosted.org/packages/53/78/fccfdc17d9c22757a58ce96b6f46d6c136f56672e7f1f74032129d64a4ad/azure-mgmt-billing-0.1.0.zip"
    sha256 "56a4365ac272f0221f79396aaabb2217f5b5eb970d28f3d80f83efc5a9481532"
  end

  resource "azure-mgmt-cdn" do
    url "https://files.pythonhosted.org/packages/ac/7a/97a3de0d0d565b911f58cee57de7240be60743f2b59094e49ba9f4d79cdc/azure-mgmt-cdn-1.0.0.zip"
    sha256 "084d2c6032601aef59bf26c1f17fc0e3b5273dafb256af550d0f069c99ac58f6"
  end

  resource "azure-mgmt-cognitiveservices" do
    url "https://files.pythonhosted.org/packages/2d/98/998cc11d25751c3fc93078040c9f725641d34d3424dd9cada2b7edf585e4/azure-mgmt-cognitiveservices-1.0.0.zip"
    sha256 "9a124d5c8827c2af3eeb1e3829e116d0ae582d27eb0e49d6a250489b7be11582"
  end

  resource "azure-mgmt-compute" do
    url "https://files.pythonhosted.org/packages/97/b6/1dd7f0ac77154ee3e1f7bbce5a3272c4c803442cdae9ab88caad84b0eed6/azure-mgmt-compute-3.1.0rc3.zip"
    sha256 "6a6ab8b429fa8bae8425a4b702c252fdcc28339b3c48d737a9bce566d76e151a"
  end

  resource "azure-mgmt-consumption" do
    url "https://files.pythonhosted.org/packages/09/48/16a8a69ea018b77dad7566a4e0ce42c9922506d88a238948e547040364d5/azure-mgmt-consumption-1.1.0.zip"
    sha256 "26cce499af8a0d3b5d1680a90a06e1ef7ddfba14364f843d22f99c7236e1b064"
  end

  resource "azure-mgmt-containerinstance" do
    url "https://files.pythonhosted.org/packages/4e/10/b302a742ed75f4b09722f8a9c2c4b708518ba158640bab27d58d636c3640/azure-mgmt-containerinstance-0.2.0.zip"
    sha256 "debf43df5cb68c80589dca2df597b8c46cc580c715179b26b18fcd546a41be00"
  end

  resource "azure-mgmt-containerregistry" do
    url "https://files.pythonhosted.org/packages/10/78/8a8b88b5cd662e0ac797996fad1a4ad09e3cad615fc9239d9a8fd46323b2/azure-mgmt-containerregistry-1.0.1.zip"
    sha256 "12589d5aeba82fdd4bd58cc7676560b31b73c818f59358ce6f598c28b905843a"
  end

  resource "azure-mgmt-containerservice" do
    url "https://files.pythonhosted.org/packages/a5/14/06f0c44180cc1398a6501a4d18ced9724da3a53fd66fd85b0dd8703b6d5f/azure-mgmt-containerservice-3.0.0.zip"
    sha256 "025835e813ba97b5b07e09e8413e1e13e3be5e3fbba8410283c91a9a781563d2"
  end

  resource "azure-mgmt-cosmosdb" do
    url "https://files.pythonhosted.org/packages/62/53/36f0c44f3b2cc64c3747002ab767d53dc96f793536c9d0b359c4df7ce98f/azure-mgmt-cosmosdb-0.2.1.zip"
    sha256 "b033d52877ed7e564fe94851f57bf3143d18356c66905acd843982c982125424"
  end

  resource "azure-mgmt-datalake-analytics" do
    url "https://files.pythonhosted.org/packages/a7/58/48e0ca69aa4b515992b743d37abfcb348d48d457bc878895be8e1913b740/azure-mgmt-datalake-analytics-0.2.0.zip"
    sha256 "2deb008be2583d7ed9573e6876f708f94b2971e6e25bc8f1c0f96d3f49900270"
  end

  resource "azure-mgmt-datalake-nspkg" do
    url "https://files.pythonhosted.org/packages/f7/eb/3b330ffd3a925db473175c3a28244bdf87c4736ce16a55be7a7535c6bfa5/azure-mgmt-datalake-nspkg-2.0.0.zip"
    sha256 "28b8774a1aba3e11c431f9c6cc984fde31a0ecbb89270924f392504f4260ca37"
  end

  resource "azure-mgmt-datalake-store" do
    url "https://files.pythonhosted.org/packages/b6/b2/bc411daf0e5cd1d2c62390b9e73559a53ffb8fb7f0253f35430e74eab17c/azure-mgmt-datalake-store-0.2.0.zip"
    sha256 "20ddcbe98e00834b12d40c2f0a96d5c8145e83d0c70ea1428235d2c2abb01bd4"
  end

  resource "azure-mgmt-devtestlabs" do
    url "https://files.pythonhosted.org/packages/66/9e/7c8e4b5a09548af7ea8a37add50a0d9e4fd0f69a97b0870c889c684677cf/azure-mgmt-devtestlabs-2.0.0.zip"
    sha256 "3c17adbea354f681a899974a20db340c5197572ccce5aa1d01d1c1c629c8a0b5"
  end

  resource "azure-mgmt-dns" do
    url "https://files.pythonhosted.org/packages/41/43/ec4c6205a1b756e9feafe61346527c217171982fb5e6317f47fb0696600d/azure-mgmt-dns-1.2.0.zip"
    sha256 "676cdcd2b83bd4b24782047ec4395657103ea89dacdcf824cf9ed8eb5584d1bf"
  end

  resource "azure-mgmt-eventgrid" do
    url "https://files.pythonhosted.org/packages/a8/b5/a3e49faa5bd5618294d411bbd11ed1ae9eb886c65b78cdcb9bea360a53e4/azure-mgmt-eventgrid-0.4.0.zip"
    sha256 "cf22195fe453627e20d81695a14e3c7b9329790763b65243be55d66964c789ac"
  end

  resource "azure-mgmt-iothub" do
    url "https://files.pythonhosted.org/packages/33/46/1283ee4c6dda32bd92018adcbdf521595a6ca80fa7e203064a2eb284d56d/azure-mgmt-iothub-0.4.0.zip"
    sha256 "65ff5bf8cc6096ab468ba444d64b501366218af15f937f0ce14173fadbc1653d"
  end

  resource "azure-mgmt-iothubprovisioningservices" do
    url "https://files.pythonhosted.org/packages/9c/a8/1ddbe8bda18673a76ad35862651242ab2dfb0dadaf770135dad8dba50f56/azure-mgmt-iothubprovisioningservices-0.1.0.zip"
    sha256 "afc226a76477e9f881979cd5376533a0fdc276b3e9540c3620ada65ef0187bd2"
  end

  resource "azure-mgmt-keyvault" do
    url "https://files.pythonhosted.org/packages/e0/c2/6c572800601330c343f993b93432f06ff2abdc35ee40ef42f81ee3a00ec2/azure-mgmt-keyvault-0.40.0.zip"
    sha256 "fb7facbcdc9157f7fb83abb41032f257a6013a02205d7c0327b56779ca20fd30"
  end

  resource "azure-mgmt-marketplaceordering" do
    url "https://files.pythonhosted.org/packages/30/16/e381dd68bfc281f110a94733abdce0626b9c38647ea17f89adc937c61f49/azure-mgmt-marketplaceordering-0.1.0.zip"
    sha256 "6da12425cbab0cc62f246e7266b4d67aff6bdd031ecbe50c7542c2f2b2440ad4"
  end

  resource "azure-mgmt-monitor" do
    url "https://files.pythonhosted.org/packages/b2/5a/ac8f8ce8b537d7c4ba6f21729a24c71da464f84d62f1e3d3daa533fb5963/azure-mgmt-monitor-0.4.0.zip"
    sha256 "1c9457c38cfe6704de3ab7320a145bb3a25cd41f55242d53e5519bf3e676eb44"
  end

  resource "azure-mgmt-msi" do
    url "https://files.pythonhosted.org/packages/2b/75/d48876229987f592358b3d4475877797fda939d9d04bbbbc13edf141fa52/azure-mgmt-msi-0.1.0.zip"
    sha256 "53eed7bc8453b764b4d568320eed032328da5b606185c216f3e93c75fa328858"
  end

  resource "azure-mgmt-network" do
    url "https://files.pythonhosted.org/packages/17/6b/28432f806d5387ec9d4a0f7b81b4bd468eef54e12e2e3061e079c4df3669/azure-mgmt-network-1.7.0.zip"
    sha256 "b3b06770e832814581601ab285f9f3cfab1ba819fa21c960ec9d461a45870321"
  end

  resource "azure-mgmt-nspkg" do
    url "https://files.pythonhosted.org/packages/fe/66/66eb0d5ead69b7371649466fa160a166de0d1ddafc4a1d7a172858a8abc9/azure-mgmt-nspkg-2.0.0.zip"
    sha256 "e36488d4f5d7d668ef5cc3e6e86f081448fd60c9bf4e051d06ff7cfc5a653e6f"
  end

  resource "azure-mgmt-rdbms" do
    url "https://files.pythonhosted.org/packages/4f/bb/fd668496474ca4a43361a83e1db7de41d4f4ff632f74bd446ede9d9f7a2a/azure-mgmt-rdbms-0.1.0.zip"
    sha256 "c06419399f04e2757f447731a09d232090a855369c9f975fc90ed9a8bddd0b01"
  end

  resource "azure-mgmt-recoveryservices" do
    url "https://files.pythonhosted.org/packages/a3/e9/476dbfc13000f7eda49b18a0c109827841b5381ce15acb651b5b4dec248e/azure-mgmt-recoveryservices-0.1.0.zip"
    sha256 "bf875b8fbfe2459f4c729c363ec6721b8d33bd7fe74bcd0a8ce27f0fcdae5aef"
  end

  resource "azure-mgmt-recoveryservicesbackup" do
    url "https://files.pythonhosted.org/packages/9f/fb/731b07c573c660780e660d883cb1d1a6d09c1b4ebd5348383eae854a4024/azure-mgmt-recoveryservicesbackup-0.1.1.zip"
    sha256 "a09a514f5c7877406bdf777007683f036f5444f878cf595a15e541e7ba5c1c66"
  end

  resource "azure-mgmt-redis" do
    url "https://files.pythonhosted.org/packages/c6/e5/4e63b267b483deeca8e41eaa0b5f8ccff03a2196ad86e80f5fe7af78dec7/azure-mgmt-redis-4.1.0.zip"
    sha256 "7ef447e2fae80853672ef276af6867976e8315e8893beb7f3fb11697fb1fb4a8"
  end

  resource "azure-mgmt-reservations" do
    url "https://files.pythonhosted.org/packages/76/32/5d7c2d8e4f71679301562cef1ae4e18536d601741c5b4789a275659ed101/azure-mgmt-reservations-0.1.0.zip"
    sha256 "73645c247b9fb2cc39d4cdab85405e55df2e8eab5a478514be0825e253660b9d"
  end

  resource "azure-mgmt-resource" do
    url "https://files.pythonhosted.org/packages/b2/39/e9c47857ff0271f337fa88ffa7e0c9914f32583bdfd5e1af3d39c0729eb7/azure-mgmt-resource-1.2.1.zip"
    sha256 "03b353f6971fdb0615c5f19150ca3b030e9b26ba76ac39df795b9046d88f8bc1"
  end

  resource "azure-mgmt-servicefabric" do
    url "https://files.pythonhosted.org/packages/e6/79/597d3e5fe6ee4ac44a42918e83a99734d25f38f0f3ef48b854bbac0a34a3/azure-mgmt-servicefabric-0.1.0.zip"
    sha256 "9f7789bdc221fcf81608cc5a3e64f1d59d41c453ff1567cb81197b19a2cd6373"
  end

  resource "azure-mgmt-sql" do
    url "https://files.pythonhosted.org/packages/4b/6f/ad8ef40cd574664556dec0f6dc0f3c5e627d9bd988697782b29dcb8fe1ed/azure-mgmt-sql-0.8.4.zip"
    sha256 "acb9e28e6a933f430e114aa792ff16fd0c483c815cb5199e1934dc078da0abc7"
  end

  resource "azure-mgmt-storage" do
    url "https://files.pythonhosted.org/packages/bb/8c/e276e122ba7881446c500e20ae8832a7eb67c71fc01d2508a15100080601/azure-mgmt-storage-1.5.0.zip"
    sha256 "b1fc3a293051dee35dffe12d618f925581d6536c94ca5c05b69461ce941125a1"
  end

  resource "azure-mgmt-trafficmanager" do
    url "https://files.pythonhosted.org/packages/68/4f/c8b62406174c8355b2c1fb62720152c0bb8046dd62bb1029fcf8c8d049d2/azure-mgmt-trafficmanager-0.40.0.zip"
    sha256 "32cd1f5fd8d902cba5dd68f5876eadf5f98f5bef8b33319b20e6b547e7c21d68"
  end

  resource "azure-mgmt-web" do
    url "https://files.pythonhosted.org/packages/c9/27/74a4d384efd03fb9aa8f0f971806695286961b45d154a0287eed2f142bcf/azure-mgmt-web-0.34.1.zip"
    sha256 "6d44f248f36dafb3a8f5175060d1959fdfa267dbd4e808b0270b8bbfd2c695c1"
  end

  resource "azure-multiapi-storage" do
    url "https://files.pythonhosted.org/packages/7f/6f/21a55969246a0ba273fb4a4a43c81bd8e209e3201b59677a6ab09d79dacb/azure-multiapi-storage-0.1.7.tar.gz"
    sha256 "8209dbe2ce2e5d8ffaf8dfc9d65088fa657153277e68fccac2d133451bec38c9"
  end

  resource "azure-nspkg" do
    url "https://files.pythonhosted.org/packages/06/a2/77820fa07ec4657d6456b67edfa78856b4789ada42d1bb8e8485df19824e/azure-nspkg-2.0.0.zip"
    sha256 "fe19ee5d8c66ee8ef62557fc7310f59cffb7230f0a94701eef79f6e3191fdc7b"
  end

  resource "azure-storage" do
    url "https://files.pythonhosted.org/packages/42/50/f038b43107a48db27fc016cb604341aa62a3946cee8f3d422075c96cde6e/azure-storage-0.34.3.tar.gz"
    sha256 "46415ba68e78ba10eab5d025e32b5bf9afe5b986060076313e05392409effdb3"
  end

  resource "bcrypt" do
    url "https://files.pythonhosted.org/packages/f3/ec/bb6b384b5134fd881b91b6aa3a88ccddaad0103857760711a5ab8c799358/bcrypt-3.1.4.tar.gz"
    sha256 "67ed1a374c9155ec0840214ce804616de49c3df9c5bc66740687c1c9b1cd9e8d"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/15/d4/2f888fc463d516ff7bf2379a4e9a552fef7f22a94147655d9b1097108248/certifi-2018.1.18.tar.gz"
    sha256 "edbc3f203427eef571f79a7692bb160a2b0f7ccaa31953e99bd17e307cf63f7d"
  end

  resource "cffi" do
    url "https://files.pythonhosted.org/packages/10/f7/3b302ff34045f25065091d40e074479d6893882faef135c96f181a57ed06/cffi-1.11.4.tar.gz"
    sha256 "df9083a992b17a28cd4251a3f5c879e0198bb26c9e808c4647e0a18739f1d11d"
  end

  resource "chardet" do
    url "https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz"
    sha256 "84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae"
  end

  resource "colorama" do
    url "https://files.pythonhosted.org/packages/e6/76/257b53926889e2835355d74fec73d82662100135293e17d382e2b74d1669/colorama-0.3.9.tar.gz"
    sha256 "48eb22f4f8461b1df5734a074b57042430fb06e1d61bd1e11b078c0fe6d7a1f1"
  end

  resource "cryptography" do
    url "https://files.pythonhosted.org/packages/78/c5/7188f15a92413096c93053d5304718e1f6ba88b818357d05d19250ebff85/cryptography-2.1.4.tar.gz"
    sha256 "e4d967371c5b6b2e67855066471d844c5d52d210c36c28d49a8507b96e2c5291"
  end

  resource "humanfriendly" do
    url "https://files.pythonhosted.org/packages/11/f4/b6525b71e5bff3f5414c1436dc428aa4936421a6de6e799555aed39f2b1e/humanfriendly-4.8.tar.gz"
    sha256 "d0e74171b87318a94b99520e4f0c5651e944b5f11d696c46be3330bb82b85300"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/f4/bd/0467d62790828c23c47fc1dfa1b1f052b24efdf5290f071c7a91d0d82fd3/idna-2.6.tar.gz"
    sha256 "2c6a5de3089009e3da7c5dde64a141dbc8551d5b7f6cf4ed7c2568d0cc520a8f"
  end

  resource "isodate" do
    url "https://files.pythonhosted.org/packages/b1/80/fb8c13a4cd38eb5021dc3741a9e588e4d1de88d895c1910c6fc8a08b7a70/isodate-0.6.0.tar.gz"
    sha256 "2e364a3d5759479cdb2d37cce6b9376ea504db2ff90252a2e5b7cc89cc9ff2d8"
  end

  resource "jmespath" do
    url "https://files.pythonhosted.org/packages/e5/21/795b7549397735e911b032f255cff5fb0de58f96da794274660bca4f58ef/jmespath-0.9.3.tar.gz"
    sha256 "6a81d4c9aa62caf061cb517b4d9ad1dd300374cd4706997aff9cd6aedd61fc64"
  end

  resource "keyring" do
    url "https://files.pythonhosted.org/packages/5e/f8/ac0b545c716ed7bab54d11669328e34a6f1eb4a5d8b188d443a7b234861f/keyring-11.0.0.tar.gz"
    sha256 "b4607520a7c97be96be4ddc00f4b9dac65f47a45af4b4cd13ed5a8879641d646"
  end

  resource "knack" do
    url "https://files.pythonhosted.org/packages/e2/b8/7ef5a8e75854c54e40fe2b085a018b5a933e7bf47f532b86760ee14d664b/knack-0.3.1.tar.gz"
    sha256 "fceb1676c51e146a49641d574bde93adb85fb2e43912609bfafa6c126072d47e"
  end

  resource "mock" do
    url "https://files.pythonhosted.org/packages/0c/53/014354fc93c591ccc4abff12c473ad565a2eb24dcd82490fae33dbf2539f/mock-2.0.0.tar.gz"
    sha256 "b158b6df76edd239b8208d481dc46b6afd45a846b7812ff0ce58971cf5bc8bba"
  end

  resource "msrest" do
    url "https://files.pythonhosted.org/packages/20/f7/4375660e01f414773d728feba5369296000fd0e5aa592527137830de76c9/msrest-0.4.26.tar.gz"
    sha256 "388294f55127102b770f6fd633b6971af56c0f3b20fdce151be1ae22ac0b9e8b"
  end

  resource "msrestazure" do
    url "https://files.pythonhosted.org/packages/6b/05/6246c8be4e82cccffef85a463cbcb44ecc3cee395015d941ac001384c00a/msrestazure-0.4.21.tar.gz"
    sha256 "6a9fb32b89b615860b4c02d40a0defc07c751196d7634a2074bd3ffb11ad01cf"
  end

  resource "oauthlib" do
    url "https://files.pythonhosted.org/packages/a5/8a/212e9b47fb54be109f3ff0684165bb38c51117f34e175c379fce5c7df754/oauthlib-2.0.6.tar.gz"
    sha256 "ce57b501e906ff4f614e71c36a3ab9eacbb96d35c24d1970d2539bbc3ec70ce1"
  end

  resource "paramiko" do
    url "https://files.pythonhosted.org/packages/c8/de/791773d6a4b23327c7475ae3d7ada0d07fa147bf77fb6f561a4a7d8afd11/paramiko-2.4.0.tar.gz"
    sha256 "486f637f0a33a4792e0e567be37426c287efaa8c4c4a45e3216f9ce7fd70b1fc"
  end

  resource "pbr" do
    url "https://files.pythonhosted.org/packages/d5/d6/f2bf137d71e4f213b575faa9eb426a8775732432edb67588a8ee836ecb80/pbr-3.1.1.tar.gz"
    sha256 "05f61c71aaefc02d8e37c0a3eeb9815ff526ea28b3b76324769e6158d7f95be1"
  end

  resource "prompt_toolkit" do
    url "https://files.pythonhosted.org/packages/8a/ad/cf6b128866e78ad6d7f1dc5b7f99885fb813393d9860778b2984582e81b5/prompt_toolkit-1.0.15.tar.gz"
    sha256 "858588f1983ca497f1cf4ffde01d978a3ea02b01c8a26a8bbc5cd2e66d816917"
  end

  resource "pyasn1" do
    url "https://files.pythonhosted.org/packages/eb/3d/b7d0fdf4a882e26674c68c20f40682491377c4db1439870f5b6f862f76ed/pyasn1-0.4.2.tar.gz"
    sha256 "d258b0a71994f7770599835249cece1caef3c70def868c4915e6e5ca49b67d15"
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/8c/2d/aad7f16146f4197a11f8e91fb81df177adcc2073d36a17b1491fd09df6ed/pycparser-2.18.tar.gz"
    sha256 "99a8ca03e29851d96616ad0404b4aad7d9ee16f25c9f9708a11faf2810f7b226"
  end

  resource "pydocumentdb" do
    url "https://files.pythonhosted.org/packages/13/bd/543b5c7120966f4cd9d241df19ace77f26dd9edb3cafe3aacef4873069a4/pydocumentdb-2.3.1.tar.gz"
    sha256 "c1c214d1154e8ad3141463a1fbc84ef43ea18d6d5f24981cbf6445a4129e3df4"
  end

  resource "Pygments" do
    url "https://files.pythonhosted.org/packages/71/2a/2e4e77803a8bd6408a2903340ac498cb0a2181811af7c9ec92cb70b0308a/Pygments-2.2.0.tar.gz"
    sha256 "dbae1046def0efb574852fab9e90209b23f556367b5a320c0bcb871c77c3e8cc"
  end

  resource "PyJWT" do
    url "https://files.pythonhosted.org/packages/c9/2a/ffd27735280696f6f244c8d1b4d2dd130511340475a29768ed317f9eaf0c/PyJWT-1.5.3.tar.gz"
    sha256 "500be75b17a63f70072416843dc80c8821109030be824f4d14758f114978bae7"
  end

  resource "PyNaCl" do
    url "https://files.pythonhosted.org/packages/08/19/cf56e60efd122fa6d2228118a9b345455b13ffe16a14be81d025b03b261f/PyNaCl-1.2.1.tar.gz"
    sha256 "e0d38fa0a75f65f556fb912f2c6790d1fa29b7dd27a1d9cc5591b281321eaaa9"
  end

  resource "pyOpenSSL" do
    url "https://files.pythonhosted.org/packages/3b/15/a5d90ab1a41075e8f0fae334f13452549528f82142b3b9d0c9d86ab7178c/pyOpenSSL-17.5.0.tar.gz"
    sha256 "2c10cfba46a52c0b0950118981d61e72c1e5b1aac451ca1bc77de1a679456773"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/54/bb/f1db86504f7a49e1d9b9301531181b00a1c7325dc85a29160ee3eaa73a54/python-dateutil-2.6.1.tar.gz"
    sha256 "891c38b2a02f5bb1be3e4793866c8df49c7d19baabf9c1bad62547e0b4866aca"
  end

  resource "pytz" do
    url "https://files.pythonhosted.org/packages/60/88/d3152c234da4b2a1f7a989f89609ea488225eaea015bc16fbde2b3fdfefa/pytz-2017.3.zip"
    sha256 "fae4cffc040921b8a2d60c6cf0b5d662c1190fe54d718271db4eb17d44a185b7"
  end

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/4a/85/db5a2df477072b2902b0eb892feb37d88ac635d36245a72a6a69b23b383a/PyYAML-3.12.tar.gz"
    sha256 "592766c6303207a20efc445587778322d7f73b161bd994f227adaa341ba212ab"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/b0/e1/eab4fc3752e3d240468a8c0b284607899d2fbfb236a56b7377a329aa8d09/requests-2.18.4.tar.gz"
    sha256 "9c443e7324ba5b85070c4a818ade28bfabedf16ea10206da1132edaa6dda237e"
  end

  resource "requests-oauthlib" do
    url "https://files.pythonhosted.org/packages/80/14/ad120c720f86c547ba8988010d5186102030591f71f7099f23921ca47fe5/requests-oauthlib-0.8.0.tar.gz"
    sha256 "883ac416757eada6d3d07054ec7092ac21c7f35cb1d2cf82faf205637081f468"
  end

  resource "scp" do
    url "https://files.pythonhosted.org/packages/1d/a9/618f1e40e30c69ffab668493953e74e6c266f383af6e34e1b8f089e41139/scp-0.10.2.tar.gz"
    sha256 "18f59e48df67fac0b069591609a0f4d50d781a101ddb8ec705f0c2e3501a8386"
  end

  resource "SecretStorage" do
    url "https://files.pythonhosted.org/packages/a5/a5/0830cfe34a4cfd0d1c3c8b614ede1edb2aaf999091ac8548dd19cb352e79/SecretStorage-2.3.1.tar.gz"
    sha256 "3af65c87765323e6f64c83575b05393f9e003431959c9395d1791d51497f29b6"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz"
    sha256 "70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9"
  end

  resource "sshtunnel" do
    url "https://files.pythonhosted.org/packages/dc/06/1d9969bbe7ad6895983016666699af2ab0b24d270c0abdecf51797d126cc/sshtunnel-0.1.2.tar.gz"
    sha256 "11032e23af010da81366ef944e8cb1cf508731e1d953463a420075acdfc02047"
  end

  resource "tabulate" do
    url "https://files.pythonhosted.org/packages/1c/a1/3367581782ce79b727954f7aa5d29e6a439dc2490a9ac0e7ea0a7115435d/tabulate-0.7.7.tar.gz"
    sha256 "83a0b8e17c09f012090a50e1e97ae897300a72b35e0c86c0b53d3bd2ae86d8c6"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/ee/11/7c59620aceedcc1ef65e156cc5ce5a24ef87be4107c2b74458464e437a5d/urllib3-1.22.tar.gz"
    sha256 "cc44da8e1145637334317feebd728bd869a35285b93cbb4cca2577da7e62db4f"
  end

  resource "vsts-cd-manager" do
    url "https://files.pythonhosted.org/packages/64/c8/c7311dde3d89d2f5e37f40f707447ef378c00a2dd359ce1bd119a152286f/vsts-cd-manager-1.0.1.tar.gz"
    sha256 "a7e05a476a441d18122a3b66d4d6d6d3142f18dea75065edffc0b258cb2b0c9d"
  end

  resource "wcwidth" do
    url "https://files.pythonhosted.org/packages/55/11/e4a2bb08bb450fdbd42cc709dd40de4ed2c472cf0ccb9e64af22279c5495/wcwidth-0.1.7.tar.gz"
    sha256 "3df37372226d6e63e1b1e1eda15c594bca98a22d33a23832a90998faa96bc65e"
  end

  resource "wheel" do
    url "https://files.pythonhosted.org/packages/fa/b4/f9886517624a4dcb81a1d766f68034344b7565db69f13d52697222daeb72/wheel-0.30.0.tar.gz"
    sha256 "9515fe0a94e823fd90b08d22de45d7bde57c90edce705b22f5e1ecf7e1b653c8"
  end

  resource "Whoosh" do
    url "https://files.pythonhosted.org/packages/25/2b/6beed2107b148edc1321da0d489afc4617b9ed317ef7b72d4993cad9b684/Whoosh-2.7.4.tar.gz"
    sha256 "7ca5633dbfa9e0e0fa400d3151a8a0c4bec53bd2ecedc0a67705b17565c31a83"
  end

  resource "xmltodict" do
    url "https://files.pythonhosted.org/packages/57/17/a6acddc5f5993ea6eaf792b2e6c3be55e3e11f3b85206c818572585f61e1/xmltodict-0.11.0.tar.gz"
    sha256 "8f8d7d40aa28d83f4109a7e8aa86e67a4df202d9538be40c0cb1d70da527b0df"
  end

  def install
    xy = Language::Python.major_minor_version "python3"
    site_packages = libexec/"lib/python#{xy}/site-packages"
    ENV.prepend_create_path "PYTHONPATH", site_packages
    ENV.prepend "LDFLAGS", "-L#{Formula["openssl"].opt_lib}"
    ENV.prepend "CFLAGS", "-I#{Formula["openssl"].opt_include}"
    ENV.prepend "CPPFLAGS", "-I#{Formula["openssl"].opt_include}"

    # Get the CLI components we'll install
    components = [
      buildpath/"src/azure-cli",
      buildpath/"src/azure-cli-core",
      buildpath/"src/azure-cli-nspkg",
      buildpath/"src/azure-cli-command_modules-nspkg",
    ]
    components += Pathname.glob(buildpath/"src/command_modules/azure-cli-*/")

    # Install dependencies
    # note: Even if in 'resources', don't include 'futures' as not needed for Python3
    # and causes import errors. See https://github.com/agronholm/pythonfutures/issues/41
    deps = resources.map(&:name).to_set - ["futures"]
    deps.each do |r|
      resource(r).stage do
        system "python3", *Language::Python.setup_install_args(libexec)
      end
    end

    # Install CLI
    components.each do |item|
      cd item do
        system "python3", *Language::Python.setup_install_args(libexec)
      end
    end

    # This replaces the `import pkg_resources` namespace imports from upstream
    # with empty string as the import is slow and not needed in this environment.
    File.open(site_packages/"azure/__init__.py", "w") {}
    File.open(site_packages/"azure/cli/__init__.py", "w") {}
    File.open(site_packages/"azure/cli/command_modules/__init__.py", "w") {}
    File.open(site_packages/"azure/mgmt/__init__.py", "w") {}

    (bin/"az").write <<~EOS
      #!/usr/bin/env bash
      export PYTHONPATH="#{ENV["PYTHONPATH"]}"
      if command -v python#{xy} >/dev/null 2>&1; then
        python#{xy} -m azure.cli \"$@\"
      else
        python3 -m azure.cli \"$@\"
      fi
    EOS

    bash_completion.install "az.completion" => "az"
  end

  test do
    json_text = shell_output("#{bin}/az cloud show --name AzureCloud")
    azure_cloud = JSON.parse(json_text)
    assert_equal azure_cloud["name"], "AzureCloud"
    assert_equal azure_cloud["endpoints"]["management"], "https://management.core.windows.net/"
    assert_equal azure_cloud["endpoints"]["resourceManager"], "https://management.azure.com/"
  end
end
