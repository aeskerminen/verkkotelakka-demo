# Verkkotelakka Demo

## Miksi uskon ohjelman toimivan oikein?

Aluksi, ohjelma on äärimmäisen yksinkertainen. Se sisältää yhden reitin, johon renderöidään yhden layoutin mukainen runko ja bodyyn LiveTable komponentti, johon on syötetty tarkkaan määritellyn skeeman mukaista dataa. Data tulee SQLite tietokannasta, joka on kymmeniä vuosia vanha ylläpidetty tietokanta (toki tässä tapauksessa Ecton kautta). Lähtökohtaisesti näin pienessä ohjelmassa on vaikea saada mitään menemään väärin, mutta sitä varten on myös vastakeinoja.

Ohjelmassa on testiympäristö, joka koostuu muutamasta yksinkertaisesta testistä, jotka varmistavat, että ohjelma toimii kunnolla. Ympäristö on deterministinen ja sen perusteella voi hyvin varmasti määritellä, toimiiko ohjelma vai ei. Toki määrittely riippuu siitä, kuin suuri koodin kattavuus on saavutettu. Tämän ohjelman tapauksessa vain päätoiminnallisuudet on testattu seed -datalla (joka kulkee kuitenkin SQLiten kautta!). Ympäristön testit reflektoivat täysin tehtävänannon vaatimukset, jotka ovat lyhyesti:
- Käyttäjän tulee nähdä tietokannasta rivejä
- Näkymässä tulee näkyä kaikki tietokannan kentät
- Käyttäjä voi hakea tietokannasta rivejä domainin perusteella (ja hakutulokset ovat korrektit)

Toiminnan oikeellisuutta vahvistaa myös lyhyet kommentit ja dokumentaatio, jota olen kirjoittanut tärkeisiin moduuleihin. Yksi isompi riski ohjelman toiminnallisuuten on testiympäristön riippuvuus LiveTablen sisäisistä IDistä, koska ne voivat muuttua tästä ohjelmistosta riippumatta ja rikkoa testiympäristön. 

## Mikä sai minut valitsemaan käyttämäni kielet ja kirjastot?

Tehtävää hahmotellessa totesin, että haluan: tehdä tehtävän kunnolla ja huolellisesti, haastaa itseäni jollain uudella (koska mitä minä olen ohjelmistokehittäjänä jos en opettele uutta?), sekä tehdä tehtävän teille relevantilla kielillä ja kirjastoilla.

Elixir oli siis luontaisin valinta tehtävää varten, koska minulla on rajattu määrä kokemusta siitä ja haluan osoittaa osaamistani teille siitä. Tutkittuani aihetta hetken,
päädyin lukemaan Elixir Phoenix -frameworkista, joka on ymmärrykseni mukaan parhaiten tuettu ja tuotantokelpoisin full-stack ympäristö Elixirille. Se sisältää kaiken tarpeellisen
devaukseen, kuten reitityksen, bäkkärin, template -pohjaisen frontin (myös LiveView, jolla voi rakentaa SPAta. Toki sen isoin miinus on websocket riippuvuus jota ei ole Reactissa tai Vuessa) ja täyden tuen testaamiselle.

Kirjastojen suhteen Elixir Phoenixin bootstrappaus komento lisää lukuisia riippuvuuksia, joista merkittävämpiä tämän softan kannalta ovat Ecto, LiveView ja Tailwind. Ecto on paras ja dokumentoiduin SQL kirjasto Elixirille, LiveView on OEM kirjasto jolla voi kehittää SPA frontteja äkkiä ja pidempään miettimättä totesin, että se voisi olla tehokas vaihtoehto tehtävänannon toteuttamiseen, koska olen tottunut käyttämään Reactia. Tailwind valmiita utility-luokkia ja nopeuttaa frontin kehittämistä huomattavasti. Lisäksi, monet komponenttikirjastot ovat siitä riippuvaisia.

Ainoa lisäys valmiina oleviin riippuvuuksiin on LiveTable (ja sen riippuvuus SutraUI). LiveTable on komponenttikirjasto, joka mahdollistaa datan näyttämisen taulumuodossa tehokkaasti. Se on myös äärimmäisen konfiguroitavissa aina skeemoista, hakutoiminnoista ja filtteröinnistä varsinaiseen käyttöliittymään asti. Löysin kyseisen kirjaston varsin nopeasti hexdocsista, kun tutkin mitä vaihtoehtoja minulla on toiminnallisuuden toteuttamiseen. Kirjasto on käsittääkseni pari vuotta vanha ja sitä ylläpitää kourallinen henkilöitä GitHubissa. Sillä on toivomaani vähemmän käyttäjiä, mutta tähän mennessä se vaikuttaa toimivan hyvin. Oikeassa tuotantosovelluksessa olisi syytä miettiä itsetehtyä ratkaisua tai forkata projekti ja tutkia sitä tarkemmin.

## Ympäristöt ja niiden käynnistäminen

Ohjelmiston pyörittämiseen vaaditaan Elixir Phoenix ja mix, jotka voi asentaa Hexdocsin [aloitusoppaan](https://hexdocs.pm/phoenix/up_and_running.html) mukaisesti.

### Devaus

demo_data.db on poikkeuksellisesti jätetty repoon, jotta ohjelmakoodin jakaminen muille on helpompaa. Seuraavilla komennoilla saa ohjelman pyörimään kun ympäristö on asennettu:

```
mix deps.get
```
```
mix ecto.migrate
```
```
mix phx.server
```

Tämä on suositeltu tapa pyörittää ohjelmaa, koska demo_data.db on populoitu riveillä.

### Testaus

```
mix deps.get
```
```
mix test
```

### Tuotanto

Huom! Tuotantoympäristön pystytetään paikallisesti ja se sisältää tietokannan, jossa ei ole rivejä. Oikeassa tuotantoympäristössä ei olisi SQLite käytössä ja se yhdistäisi ulkoiseen tietokantaan, jossa data eläisi pysyvästi.

```
MIX_ENV=prod mix assets.deploy
```
```
MIX_ENV=prod mix release
```
```
SECRET_KEY_BASE="$(mix phx.gen.secret)" DATABASE_PATH="/tmp/verkkotelakka_demo_release.db" PHX_SERVER=true PHX_HOST=localhost _build/prod/rel/verkkotelakka_demo/bin/verkkotelakka_demo start
```
