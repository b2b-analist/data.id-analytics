# Pustaka
library(leaflet)

# Ambil data
bagi_hasil <- read.csv(
  "http://data.go.id/dataset/64bda63f-c2ee-4128-8b63-7047c950f6b3/resource/476513d0-f4f8-4a3a-a020-773dcf843c1f/download/processeddanabagihasilminyakbumiperkkkskabupaten20102011.csv",
  header=TRUE,
  sep=",")

# Data 2010
bagi_hasil_2010 <- subset(bagi_hasil,tahun==2010)

# Batas 1 Triliun
bagi_hasil_2010$color <- ifelse(bagi_hasil_2010$penerimaan_sda > 1000000000000,"red","green")

# Popup onClick
bagi_hasil_2010$popup <- paste0(
	"<strong>", bagi_hasil_2010$nama_provinsi,
	", ", bagi_hasil_2010$nama_kabkota,
	"</strong><br>", bagi_hasil_2010$kkks,
	", ", bagi_hasil_2010$jenis_minyak,
	"<br>Penerimaan SDA 2010 : ", format(bagi_hasil_2010$penerimaan_sda,
		scientific=FALSE, format="d", big.mark=".", decimal.mark=","),
        "<br>DBH Provinsi 2010 : ", format(bagi_hasil_2010$penerimaan_sda,
                scientific=FALSE, format="d", big.mark=".", decimal.mark=","),
        "<br>DBH Penghasil 2010 : ", format(bagi_hasil_2010$penerimaan_sda,
                scientific=FALSE, format="d", big.mark=".", decimal.mark=","),
        "<br>DBH Pemerataan 2010 : ", format(bagi_hasil_2010$penerimaan_sda,
                scientific=FALSE, format="d", big.mark=".", decimal.mark=","))

# Buat Peta
leaflet(data=bagi_hasil_2010) %>%
addTiles() %>%
addCircleMarkers(
	~longitude, ~latitude,
	color=~color,
	stroke=FALSE,
	fillOpacity=0.5,
	popup=~popup)
