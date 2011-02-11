# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Artist.create(
  :email                  =>  "pedro@pab.lo",
  :password               =>  "pedropablo",
  :password_confirmation  =>  "pedropablo",
  :birthdate              =>  Date.civil(1980, 01, 01),
  :country                =>  "Chile"
)

Artist.create(
  :email                  =>  "pablo@ped.ro",
  :password               =>  "pablopedro",
  :password_confirmation  =>  "pablopedro",
  :birthdate              =>  Date.civil(1979, 05, 06),
  :country                =>  "Canada"
)

Text.create(
  :author                 => "John Jackson",
  :title                  => "Useless uselessness for you to do nothing",
  :content                => "

    <p>Migrations can manage the evolution of a schema used by several physical
    databases. It’s a solution to the common problem of adding a field to
    make a new feature work in your local database, but being unsure of how to
    push that change to other developers and to the production server. With
    migrations, you can describe the transformations in self-contained classes
    that can be checked into version control systems and executed against
    another database that might be one, two, or five versions behind.</p>

    <p>This migration will add a boolean flag to the accounts table and remove it
    if you’re backing out of the migration. It shows how all migrations have
    two class methods <tt>up</tt> and <tt>down</tt> that describes the
    transformations required to implement or remove the migration. These
    methods can consist of both the migration specific methods like add_column
    and remove_column, but may also contain regular Ruby code for generating
    data needed for the transformations.</p>

    <p>This migration first adds the system_settings table, then creates the very
    first row in it using the Active Record model that relies on the table. It
    also uses the more advanced create_table syntax where you can specify a
    complete table schema in one block call.</p>
  "
)

Text.create(
  :author                 => "F. Andreas Hamburger",
  :title                  => "Debordist image and neotextual narrative",
  :content                => "
  
    <h1>1. Realities of meaninglessness</h1>
    
    <p>The main theme of Long&#8217;s critique of Debordist 
    situation is the defining characteristic, and subsequent meaninglessness, of 
    dialectic art. Therefore, neotextual narrative holds that the goal of the 
    artist is significant form. </p>
    
    <p>&#8220;Class is part of the fatal flaw of sexuality,&#8221; says Lyotard. The subject is 
    interpolated into a neotextual patriarchial theory that includes narrativity as 
    a paradox. But many constructions concerning a mythopoetical totality may be 
    discovered. </p> 

    <p>The characteristic theme of the works of Stone is the role of the poet as 
    observer. Sontag suggests the use of Debordist image to attack sexist 
    perceptions of culture. However, the subject is contextualised into a 
    Lyotardist narrative that includes narrativity as a reality. </p>
    
    <p>Baudrillard promotes the use of neotextual narrative to challenge and modify 
    sexual identity. But Foucault uses the term &#8216;neotextual patriarchial theory&#8217; to 
    denote a precultural totality. </p>
    
    <p>The premise of Debordist image states that language is capable of 
    significance, given that culture is distinct from sexuality. However, Sartre 
    uses the term &#8216;neotextual narrative&#8217; to denote the failure, and some would say 
    the defining characteristic, of conceptual society. </p> 
    
    <p>The subject is interpolated into a subcapitalist theory that includes 
    consciousness as a paradox. In a sense, Dahmus suggests 
    that we have to choose between neotextual patriarchial theory and 
    postpatriarchialist dialectic theory. </p> 

    <p>If neotextual narrative holds, the works of Stone are empowering. Therefore, 
    Lacan suggests the use of Debordist image to attack capitalism. </p> 
    <p>The example of the neocultural paradigm of narrative intrinsic to Stone&#8217;s 
    <i>Natural Born Killers</i> emerges again in <i>JFK</i>, although in a more 
    mythopoetical sense. However, an abundance of discourses concerning neotextual 
    narrative exist. </p> 
    
    <h1>2. Debordist image and structural postdialectic theory</h1> 
    
    <p>In the works of Stone, a predominant concept is the distinction between 
    opening and closing. Marx uses the term &#8216;structural postdialectic theory&#8217; to 
    denote not theory, but subtheory. But Reicher implies 
    that we have to choose between Debordist image and neodialectic desituationism.</p>
     
    <p>&#8220;Society is dead,&#8221; says Baudrillard; however, according to Parry,
    it is not so much society that is dead, but rather the 
    paradigm of society. If neotextual narrative holds, the works of Stone are 
    reminiscent of McLaren. In a sense, Sontag uses the term &#8216;Debordist image&#8217; to 
    denote the meaninglessness, and eventually the genre, of subcultural sexual 
    identity. </p> 
    
    <p>In the works of Stone, a predominant concept is the concept of capitalist 
    truth. The subject is contextualised into a structural postdialectic theory 
    that includes sexuality as a whole. Therefore, the without/within distinction 
    depicted in Stone&#8217;s <i>Natural Born Killers</i> is also evident in <i>Heaven 
    and Earth</i>. </p> 

    <p>If one examines Debordist image, one is faced with a choice: either reject 
    neoconstructive capitalist theory or conclude that consensus is a product of 
    the collective unconscious. The subject is interpolated into a Debordist image 
    that includes culture as a paradox. Thus, several constructions concerning not 
    discourse, as structural postdialectic theory suggests, but prediscourse may be 
    found. </p> 
    
    <p>In the works of Stone, a predominant concept is the distinction between 
    creation and destruction. The subject is contextualised into a neotextual 
    narrative that includes art as a totality. Therefore, the primary theme of 
    Finnis&#8217;s essay on Debordist image is the common ground 
    between language and sexual identity. </p> 
    
    <p>The main theme of the works of Stone is the collapse, and therefore the 
    stasis, of cultural society. Pickett holds that we have 
    to choose between structural postdialectic theory and Lacanist obscurity. Thus, 
    many sublimations concerning the textual paradigm of narrative exist. </p> 
    
    <p>The characteristic theme of Sargeant&#8217;s analysis of 
    structural postdialectic theory is the role of the reader as participant. 
    However, if Debordist image holds, we have to choose between neotextual 
    narrative and cultural postmodernist theory. </p> 

    <p>D&#8217;Erlette suggests that the works of Stone are an 
    example of self-referential libertarianism. In a sense, if structural 
    postdialectic theory holds, we have to choose between Debordist image and 
    cultural theory. </p> 
    
    <p>Marx promotes the use of predialectic cultural theory to challenge sexual 
    identity. However, Drucker holds that we have to choose 
    between Debordist image and the constructivist paradigm of discourse. </p> 
    
    <p>Structural postdialectic theory states that the establishment is 
    intrinsically meaningless, but only if the premise of Debordist image is valid; 
    if that is not the case, consciousness may be used to oppress the proletariat. 
    But the example of precapitalist discourse which is a central theme of Eco&#8217;s 
    <i>Foucault&#8217;s Pendulum</i> emerges again in <i>The Island of the Day 
    Before</i>, although in a more mythopoetical sense. </p> 

    <p>The primary theme of the works of Eco is the collapse, and some would say 
    the economy, of cultural class. In a sense, Bataille uses the term &#8216;Debordist 
    image&#8217; to denote a self-falsifying reality. </p> 
    
    <p>If neomodernist rationalism holds, we have to choose between structural 
    postdialectic theory and the conceptual paradigm of narrative. But in 
    <i>Foucault&#8217;s Pendulum</i>, Eco denies precultural situationism; in <i>The 
    Limits of Interpretation (Advances in Semiotics)</i>, however, he affirms 
    structural postdialectic theory. </p> 
    
    <p>Lyotard uses the term &#8216;neotextual narrative&#8217; to denote the role of the 
    writer as observer. In a sense, an abundance of narratives concerning a 
    mythopoetical paradox may be discovered. </p> 

    <h1>3. Eco and structural postdialectic theory</h1> 
    
    <p>In the works of Eco, a predominant concept is the concept of semanticist 
    language. The main theme of Reicher&#8217;s essay on 
    neotextual narrative is the futility, and subsequent meaninglessness, of 
    cultural sexual identity. Therefore, the subject is interpolated into a 
    subconceptual deconstructivist theory that includes reality as a reality. </p> 
    
    <p>The characteristic theme of the works of Eco is a self-justifying whole. In 
    a sense, Lacan uses the term &#8216;structural postdialectic theory&#8217; to denote the 
    difference between culture and society. </p> 
    
    <p>The subject is contextualised into a Debordist image that includes sexuality 
    as a totality. But the main theme of Dietrich&#8217;s
    critique of neotextual narrative is a capitalist paradox. </p> 
    
    <p>Debord uses the term &#8216;Foucaultist power relations&#8217; to denote the bridge 
    between class and narrativity. However, Sontag suggests the use of Debordist 
    image to deconstruct the status quo. </p> 
    
    <h1>4. Expressions of paradigm</h1> 
    
    <p>The primary theme of the works of Eco is the role of the artist as observer. 
    Many discourses concerning neotextual narrative exist. Thus, the subject is 
    interpolated into a Debordist image that includes art as a whole. </p> 
    
    <p>&#8220;Sexual identity is part of the meaninglessness of culture,&#8221; says Marx; 
    however, according to Wilson , it is not so much sexual 
    identity that is part of the meaninglessness of culture, but rather the 
    collapse, and eventually the meaninglessness, of sexual identity. Prinn 
    suggests that we have to choose between neotextual 
    narrative and postconstructivist theory. In a sense, if textual subcultural 
    theory holds, the works of Tarantino are empowering. </p> 

    <p>The subject is contextualised into a structural postdialectic theory that 
    includes narrativity as a totality. But the masculine/feminine distinction 
    depicted in Tarantino&#8217;s <i>Jackie Brown</i> is also evident in <i>Four 
    Rooms</i>. </p>
    
    <p>Foucault uses the term &#8216;Debordist image&#8217; to denote the absurdity of 
    deconstructivist class. In a sense, Geoffrey states 
    that we have to choose between neoconceptual capitalism and Sontagist camp. 
    </p>
    
    <p>The main theme of Cameron&#8217;s model of neotextual 
    narrative is the difference between consciousness and class. However, the 
    subject is interpolated into a Debordist image that includes art as a whole. </p> 
  "
)