/* Fernando Dominguez Garcia */
/* Base de datos Slay the Spire */
/* Creacion de la base de datos */
drop database if exists slaythespire;
create database slaythespire;
use slaythespire;

/* Creacion de las tablas */
drop table if exists play;
drop table if exists earn;
drop table if exists relic;
drop table if exists heroe;
drop table if exists card;


create table card(
    nameCard varchar(30) not null,
    rarityCard varchar(10),
    typeCard varchar(10) not null,
    cost smallint(10),
    descriptionCard varchar(150) not null,

    primary key(nameCard)

)ENGINE=InnoDB;

create table heroe(
    nameHeroe varchar(10) not null,
    hp smallint(5),
    descriptionHeroe varchar(100) not null,

    primary key(nameHeroe)
)ENGINE=InnoDB;

create table relic(
    nameRelic varchar(30) not null,
    rarityRelic varchar(10) not null,
    DescriptionRelic varchar(150)not null,

    primary key(nameRelic)
)ENGINE=InnoDB;

create table earn(
    earn_nameRelic varchar(30) not null,
    earn_nameHeroe varchar(10) not null,

    primary key(earn_nameRelic, earn_nameHeroe),

    constraint fk_earn_Relic
		foreign key (earn_nameRelic)
		references Relic (nameRelic)
	on delete cascade on update cascade,

    constraint fk_earn_Heroe
		foreign key (earn_nameHeroe)
		references Heroe (nameHeroe)
	on delete cascade on update cascade

)ENGINE=InnoDB;

create table play(
    play_nameCard varchar(30) not null,
    play_nameHeroe varchar(10) not null,

    primary key(play_nameCard, play_nameHeroe),

    constraint fk_play_Card
		foreign key (play_nameCard)
		references Card (nameCard)
	on delete cascade on update cascade,

    constraint fk_play_Heroe
		foreign key (play_nameHeroe)
		references Heroe (nameHeroe)
	on delete cascade on update cascade

)ENGINE=InnoDB;


/******* INSERTAR DATOS ******/

/* Insertar card */
Insert into card values('Apparition','Special','Skill','1','Gain 1 Intangible. Exhaust. Ethereal.');
Insert into card values('Bite','Special','Attack','1','Deal7 damage. Heal 2 HP.');
Insert into card values('J.A.X','Special','Skill','0','Lost 3 HP. Gain 2 Strenght.');
Insert into card values('Ritual Dagger','Special','Attack','1','Deal 15 damage. If this kills an enemy then permanently increase this cards damage by 3.');
Insert into card values('Shiv','Special','Attack','0','Deal 4 damage. Exhaust.');
Insert into card values('Bandage Up','Uncommon','Skill','0','Heal 4 HP. Exhaust.');
Insert into card values('Blind','Uncommon','Skill','0','Apply 2 Weak.');
Insert into card values('Dark Shackles','Uncommon','Skill','0','Enemy loses 9 Strength for the rest of this turn.');
Insert into card values('Deep Breath','Uncommon','Skill','0','Shuffle your discard pile into your draw pile. Draw 1 card.');
Insert into card values('Discovery','Uncommon','Skill','1','Choose 1 of 3 random cards to add to your hand. It costs 0 this turn. Exhaust.');
Insert into card values('Dramatic Entrance','Uncommon','Skill','0','Innate. Deal 6 damage to ALL enemies.');
Insert into card values('Enlightenment','Uncommon','Skill','0','Reduce the cost of cards in your hand to 1 this turn.');
Insert into card values('Finesse','Uncommon','Skill','0','Gain 2 Block. Draw 1 card.');
Insert into card values('Flash of Steel','Uncommon','Attack','0','Deal 3 damage. Draw 1 card.');
Insert into card values('Forethought','Uncommon','Skill','0','Place a card from your hand on the bottom of your draw pile. It costs 0 until played. ');
Insert into card values('Good Instincts','Uncommon','Skill','0','Gain 5 Block');
Insert into card values('Impatience','Uncommon','Skill','0','If you have no Attackcards in your hand, draw 2 cards.');
Insert into card values('Jack Of All Trades','Uncommon','Skill','0','Add 1 random Colorless card to your hand. Exhaust.');
Insert into card values('Madness','Uncommon','Skill','1','A random card in your hand costs 0 for the rest of combat. Exhaust.');
Insert into card values('Mind Blast','Uncommon','Attack','2','Innate. Deal damage equal to the number of cards in your draw pile.');
Insert into card values('Panacea','Uncommon','Skill','0','Gain 1 Artifact. Exhaust.');
Insert into card values('Panic Button','Uncommon','Skill','0','Gain 30 Block. You cannot gain Block from cards for the next 2 turns. Exhaust.');
Insert into card values('Purity','Uncommon','Skill','0','Choose and exhaust 3 cards in your hand. Exhaust. ');
Insert into card values('Swift Strike','Uncommon','Attack','0','Deal 6 damage.');
Insert into card values('Trip','Uncommon','Skill','0','Apply 2 Vulnerable.');
Insert into card values('Apotheosis','Rare','Skill','2','Upgrade ALL of your cards for the rest of combat. Exhaust.');
Insert into card values('Chrysalis','Rare','Skill','2','Add 3 random Skillsinto your Draw Pile. They cost 0 this combat. Exhaust.');
Insert into card values('Hand of Greed','Rare','Attack','2','Deal 20 damage. If this kills a non-minion enemy, gain 20 Gold.');
Insert into card values('Magnetism','Rare','Skill','2','At the start of each turn, add a random colorless card to your hand.');
Insert into card values('Master of Strategy','Rare','Skill','0','Draw 3 cards. Exhaust.');
Insert into card values('Maythem','Rare','Power','2','At the start of your turn, play the top card of your draw pile.');
Insert into card values('Metamorphosis','Rare','Skill','2','Add 3 random Attacks into your Draw Pile. They cost 0 this combat. Exhaust. ');
Insert into card values('Panache','Rare','Power','0','Every time you play 5 cards in a single turn, deal 10 damage to ALL enemies.');
Insert into card values('Sadistic Nature','Rare','Power','0','Whenever you apply a Debuff to an enemy, they take 3 damage.');
Insert into card values('Secret Technique','Rare','Skill','0','Choose a Skill from your draw pile and place it into your hand. Exhaust. ');
Insert into card values('Secret Weapon','Rare','Skill','0','Choose an Attack from your draw pile and place it into your hand. Exhaust.');
Insert into card values('The Bomb','Rare','Skill','2','At the end of 3 turns, deal 30 damage to ALL enemies.');
Insert into card values('Thinking Ahead','Rare','Skill','0','Draw 2 cards. Place a card from your hand on top of your draw pile. Exhaust.');
Insert into card values('Transmutation','Rare','Skill','0','Add X random colorless cards into your hand. They cost 0 this turn. Exhaust. ');
Insert into card values('Violence','Rare','Skill','0','Place 3 random Attack cards from your draw pile into your hand. Exhaust. ');
Insert into card values('Ascenders Bane','NULL','Curse','0','Unplayable. Cannot be removed from your deck. Ethereal.');
Insert into card values('Clumsy','NULL','Curse','0','Unplayable. Ethereal.');
Insert into card values('Decay','NULL','Curse','0','Unplayable. At the end of your turn, take 2 damage.');
Insert into card values('Doubt','NULL','Curse','0','Unplayable. At the end of your turn, gain 1 Weak.');
Insert into card values('Injury','NULL','Curse','0','Unplayable. ');
Insert into card values('Necronomicurse','NULL','Curse','0','Unplayable. There is no escape from this Curse.');
Insert into card values('Normality','NULL','Curse','0','Unplayable. You cannot play more than 3 cards this turn.');
Insert into card values('Panin','NULL','Curse','0','Unplayable. While in hand, lose 1 HP when other cards are played.');
Insert into card values('Parasite','NULL','Curse','0','Unplayable. If transformed or removed from your deck, lose 3 Max HP.');
Insert into card values('Pride','NULL','Curse','0','Unplayable. At the end of your turn, put a copy of this card on top of your draw pile. Exhaust.');
Insert into card values('Regret','NULL','Curse','0','Unplayable. At the end of your turn, lose HP equal to the number of cards in your hand.');
Insert into card values('Shame','NULL','Curse','0','Unplayable. At the end of your turn, gain 1 Frail.');
Insert into card values('Weithe','NULL','Curse','0','Unplayable. Innate.');
Insert into card values('Burn','NULL','Status','0','Unplayable.At the end of your turn, take 4 damage.');
Insert into card values('Dazed','NULL','Status','0','Unplayable. Ethereal.');
Insert into card values('Wound','NULL','Status','0','Unplayable.');
Insert into card values('Slimed','NULL','Status','1','Exhaust');
Insert into card values('Void','NULL','Status','0','Unplayable. When this card is drawn, lose 1 Energy. Ethereal.');
Insert into card values('Defend','Starter','Skill','1','Gain 5 Block.');
Insert into card values('Strike','Starter','Attack','1','Deal 6 damage.');
Insert into card values('Bash','Starter','Attack','2','Deal 8 damage. Apply 2 Vulnerable.');
Insert into card values('Anger','Common','Attack','0','Deal 6 damage. Add a copy of this card to your discard pile.');
Insert into card values('Armaments','Common','Skill','1','Gain 5 Block. Upgrade a card in your hand for the rest of combat.');
Insert into card values('Body Slam','Common','Attack','1','Deal damage equal to your current Block.');
Insert into card values('Clash','Common','Attack','0','Can only be played if every card in your hand is an Attack. Deal 14 damage.');
Insert into card values('Cleave','Common','Attack','1','Deal 8 damage to ALL enemies.');
Insert into card values('Clothesline','Common','Attack','2','Deal 12 damage. Apply 2 Weak.');
Insert into card values('Flex','Common','Skill','0','Gain 2 Strength. At the end of your turn, lose 2 Strength.');
Insert into card values('Havoc','Common','Skill','1','Play the top card of your draw pile and Exhaust it.');
Insert into card values('Headbutt','Common','Attack','1','Deal 9 damage. Place a card from your discard pile on top of your draw pile.');
Insert into card values('Heavy Blade','Common','Attack','2','Deal 14 damage. Strength affects Heavy Blade 3 times.');
Insert into card values('Iron Wave','Common','Attack','1','Gain 5 Block. Deal 5 damage.');
Insert into card values('Perfected Strike','Common','Attack','2','Deal 6 damage. Deals an additional 2 damage for ALL of your cards containing Strike.');
Insert into card values('Pommel Strike','Common','Attack','1','Deal 9 damage. Draw 1 card.');
Insert into card values('Shrug it Off','Common','Skill','1','Gain 8 Block. Draw 1 card.');
Insert into card values('Sworf Boomerang','Common','Attack','1','Deal 3 damage to a random enemy 3 times.');
Insert into card values('Thunderclap','Common','Attack','1','Deal 4 damage and apply 1 Vulnerable to ALL enemies.');
Insert into card values('True Grit','Common','Skill','1','Gain 7 Block. Exhaust a random card from your hand.');
Insert into card values('Twin Strike','Common','Attack','1','Deal 5 damage twice.');
Insert into card values('Warcry','Common','Skill','2','Draw 1 card. Place a card from your hand on top of your draw pile. Exhaust.');
Insert into card values('Wild Strike','Common','Attack','1','Deal 12 damage. Shuffle a Wound into your draw pile.');
Insert into card values('Battle Trance','Uncommon','Skill','0','Draw 3 cards. You cannot draw additional cards this turn.');
Insert into card values('Blood for Blood','Uncommon','Attack','4','Cost 1 less energy for each time you lose HP in combat. Deal 18 damage.');
Insert into card values('Bloodletting','Uncommon','Skill','0','Lose 3 HP. Gain 1 Energy.');
Insert into card values('Burning Pact','Uncommon','Skill','1','	Exhaust 1 card. Draw 2 cards.');
Insert into card values('Carnage','Uncommon','Attack','2','Ethereal. Deal 20 damage.');
Insert into card values('Combust','Uncommon','Power','1','At the end of your turn, lose 1 HP and deal 5 damage to ALL enemies.');
Insert into card values('Corruption','Uncommon','Power','3','Skills cost 0. Whenever you play a Skill,Exhaust it.');
Insert into card values('Disarm','Uncommon','Skill','1','Enemy loses 2 Strength. Exhaust.');
Insert into card values('Dropkick','Uncommon','Attack','1','Deal 5 damage. If the enemy is Vulnerable, gain 1 energy and draw 1 card.');
Insert into card values('Dual Wield','Uncommon','Skill','1','Create a copy of an Attack or Power card in your hand.');
Insert into card values('Entrench','Uncommon','Skill','2','Double your current Block.');
Insert into card values('Evolve','Uncommon','Power','1','Whenever you draw a Status, draw 1 card.');
Insert into card values('Feel No Pain','Uncommon','Power','1','Whenever a card is Exhausted, gain 3 Block.');
Insert into card values('Fire Breathing','Uncommon','Power','1','At the end of your turn, for each Attack played this turn deal 1 damage to ALL enemies.');
Insert into card values('Flame Barrier','Uncommon','Skill','2','Gain 12 Block. Whenever you are attacked this turn, deal 4 damage to the attacker.');
Insert into card values('Ghostly Armor','Uncommon','Skill','1','Ethereal. Gain 10 Block.');
Insert into card values('Hemokinesis','Uncommon','Attack','1','Lose 3 HP. Deal 14 damage.');
Insert into card values('Infernal Blade','Uncommon','Skill','1','Add a random Attack to your hand. It costs 0 this turn. Exhaust.');
Insert into card values('Inflame','Uncommon','Power','1','Gain 2 Strength.');
Insert into card values('Intimidate','Uncommon','Skill','1','Apply 1 Weak to ALL enemies. Exhaust.');
Insert into card values('Metallicize','Uncommon','Power','1','At the end of your turn, gain 3 Block.');
Insert into card values('Power Through','Uncommon','Skill','1','Add 2 Wounds to your hand. Gain 15 Block.');
Insert into card values('Pummel','Uncommon','Attack','1','Deal 2 damage 4 times. Exhaust.');
Insert into card values('Rage','Uncommon','Skill','0','Whenever you play an Attack this turn, gain 3 Block');
Insert into card values('Rampage','Uncommon','Attack','1','Deal 8 damage. Every time this card is played, increase its damage by 5 for this combat.');
Insert into card values('Reckless Charge','Uncommon','Attack','0','Deal 7 damage. Shuffle a Dazed into your draw pile');
Insert into card values('Rupture','Uncommon','Power','1','Whenever you lose HP from a card, gain 1 Strength.');
Insert into card values('Searing Blow','Uncommon','Attack','2','Deal 12 damage. Can be upgraded any number of times.');
Insert into card values('Second Wind','Uncommon','Skill','1','Exhaust all non-Attack cards in your hand and gain 5 Block for each.');
Insert into card values('Seeing Red','Uncommon','Skill','1','Gain 2 energy. Exhaust.');
Insert into card values('Sentinel','Uncommon','Skill','1','Gain 5 Block. If this card is Exhausted, gain 2 energy.');
Insert into card values('Sever Soul','Uncommon','Attack','2','Exhaust all non-Attack cards in your hand. Deal 16 damage.');
Insert into card values('Shockwave','Uncommon','Skill','2','Apply 3 Weak and Vulnerable to ALL enemies. Exhaust.');
Insert into card values('Spot Weakness','Uncommon','Skill','1','If an enemy intends to attack, gain 3 Strength.');
Insert into card values('Uppercut','Uncommon','Attack','2','Deal 13 damage. Apply 1 Weak. Apply 1 Vulnerable.');
Insert into card values('Whirlwind','Uncommon','Attack','0','Deal 5 damage to ALL enemies X times.');
Insert into card values('Barricade','Rare','Power','3','Block no longer expires at the start of your turn.');
Insert into card values('Berserk','Rare','Power','0','Gain 3 Vulnerable. Gain 1 Energy at the start of your turn.');
Insert into card values('Bludgeon','Rare','Attack','3','	Deal 32 damage.');
Insert into card values('Brutality','Rare','Power','0','At the start of your turn, lose 1 HP and draw 1 card.');
Insert into card values('Dark Embrace','Rare','Power','2','Whenever a card is Exhausted, draw 1 card.');
Insert into card values('Demon Form','Rare','Power','3','At the start of each turn, gain 2 Strength.');
Insert into card values('Double Tap','Rare','Skill','1','This turn, your next Attack is played twice.');
Insert into card values('Exhume','Rare','Skill','1','Place a card from your Exhaust pile into your hand. Exhaust.');
Insert into card values('Feed','Rare','Attack','1','Deal 10 damage. If this kills a non-minion enemy, gain 3 permanent Max HP. Exhaust.');
Insert into card values('Fiend Fire','Rare','Attack','1','Exhaust your hand. Deal 7 damage for each Exhausted card. Exhaust.');
Insert into card values('Inmolate','Rare','Attack','2','Deal 21 damage to ALL enemies. Add a Burn to your discard pile.');
Insert into card values('Impervious','Rare','Skill','2','Gain 30 Block. Exhaust.');
Insert into card values('Juggernaut','Rare','Power','2','Whenever you gain Block, deal 5 damage to a random enemy.');
Insert into card values('Limit Break','Rare','Skill','1','Double your Strength. Exhaust');
Insert into card values('Offering','Rare','Skill','0','Lose 6 HP. Gain 2 energy. Draw 3 cards. Exhaust.');
Insert into card values('Reaper','Rare','Attack','2','Deal 4 damage to ALL enemies. Heal for unblocked damage dealt. Exhaust.');
Insert into card values('Neutralize','Starter','Attack','0','Deal 3 damage. Apply 1 Weak.');
Insert into card values('Survivor','Starter','Skill','1','Gain 8 Block. Discard a card.');
Insert into card values('Acrobatics','Common','Skill','1','Draw 3 cards. Discard 1 card.');
Insert into card values('Backflip','Common','Skill','1','Gain 5 block. Draw 2 cards.');
Insert into card values('Bane','Common','Attack','1','Deal 7 damage. If the enemy is Poisoned, deal 7 damage again.');
Insert into card values('Blade Dance','Common','Skill','1','Add 2 Shivs to your hand.');
Insert into card values('Cloack and Dagger','Common','Skill','1','Gain 6 Block. Add 1 Shiv to your hand.');
Insert into card values('Dagger Spray','Common','Attack','1','Deal 4 damage to ALL enemies twice.');
Insert into card values('Dagger Throw','Common','Attack','1','Deal 9 damage. Draw 1 card. Discard 1 card.');
Insert into card values('Deadly Poison','Common','Skill','1','Apply 5 Poison.');
Insert into card values('Deflect','Common','Skill','0','Gain 4 Block.');
Insert into card values('Dodge and Roll','Common','Skill','1','Gain 4 Block. Next turn gain 4 Deal 8 damage. Next turn gain 1 Energy.Block.');
Insert into card values('Flying Knee','Common','Attack','1','Deal 8 damage. Next turn gain 1 Energy.');
Insert into card values('Outmaneuver','Common','Skill','1','Next turn gain 2 Energy.');
Insert into card values('Piercing Wail','Common','Skill','1','ALL enemies lose 6 Strength for 1 turn. Exhaust.');
Insert into card values('Poisoned Stab','Common','Attack','1','Deal 6 damage. Apply 3 Poison.');
Insert into card values('Prepared','Common','Skill','0','Draw 1 card. Discard 1 card.');
Insert into card values('Quick Slash','Common','Attack','1','Deal 8 damage. Draw 1 card.');
Insert into card values('Silent','Common','Attack','0','Deal 5 damage.');
Insert into card values('Sneaky Strike','Common','Attack','2','Deal 10 damage. If you have discarded a card this turn, gain 2 Energy.');
Insert into card values('Sucker Punch','Common','Attack','1','Deal 7 damage. Apply 1 Weak.');
Insert into card values('Accuracy','Uncommon','Power','1','Shivs deal 3 additional damage.');
Insert into card values('All-Out Attack','Uncommon','Attack','1','Deal 10 damage to ALL enemies. Discard 1 card at random.');
Insert into card values('Backstab','Uncommon','Attack','0','Deal 11 damage. Innate. Exhaust.');
Insert into card values('Blur','Uncommon','Skill','1','Gain 5 Block. Block is not removed at the start of your next turn.');
Insert into card values('Bouncing Flask','Uncommon','Skill','2','Apply 3 poison to a random enemy 3 times.');
Insert into card values('Calculated Gamble','Uncommon','Skill','0','Discard your hand, then draw that many cards. Exhaust.');
Insert into card values('Caltrops','Uncommon','Power','1','Whenever you are attacked, deal 3 damage to the attacker.');
Insert into card values('Catalyst','Uncommon','Skill','1','Double an enemys Poison. Exhaust.');
Insert into card values('Choke','Uncommon','Attack','2','Deal 12 damage. Whenever you play a card this turn, targeted enemy loses 3 HP.');
Insert into card values('Concentrate','Uncommon','Skill','0','Discard 3 cards. Gain 2 Energy.');
Insert into card values('Crippling Cloud','Uncommon','Skill','2','Apply 4 Poison and 2 Weak to ALL enemies. Exhaust.');
Insert into card values('Dash','Uncommon','Attack','2','Gain 10 Block. Deal 10 damage.');
Insert into card values('Distraction','Uncommon','Skill','1','Add a random Skill to your hand. It costs 0 this turn. Exhaust.');
Insert into card values('Endless Agony','Uncommon','Attack','0','Whenever you draw this card, add a copy of it to your hand. Deal 4 damage. Exhaust.');
Insert into card values('Escape Plan','Uncommon','Skill','0','Draw 1 card. If the card is a Skill, gain 3 Block.');
Insert into card values('Eviscerate','Uncommon','Attack','4','Costs 1 less Energy for each card discarded this turn. Deal 6 damage three times.');
Insert into card values('Expertise','Uncommon','Skill','1','Draw cards until you have 6 in your hand.');
Insert into card values('Finisher','Uncommon','Attack','1','Deal 6 damage for each Attack played this turn.');
Insert into card values('Flechettes','Uncommon','Attack','1','Deal 4 damage for each Skill in your hand.');
Insert into card values('Footwork','Uncommon','Power','1','Gain 2 Dexterity.');
Insert into card values('Heel Hook','Uncommon','Attack','1','Deal 5 damage. If the enemy is Weak, Gain 1 Energy and draw 1 card.');
Insert into card values('Infinite Blades','Uncommon','Power','1','At the start of your turn, add a Shiv to your hand.');
Insert into card values('Leg Sweep','Uncommon','Skill','2','Apply 2 Weak. Gain 11 Block.');
Insert into card values('Masterful Stab','Uncommon','Attack','0','Costs 1 additional Energy for each time you lose HP this combat. Deal 12 damage.');
Insert into card values('Noxious Fumes','Uncommon','Power','1','At the start of your turn, apply 2 Poison to ALL enemies.');
Insert into card values('Predator','Uncommon','Attack','2','Deal 15 damage. Draw 2 more cards next turn.');
Insert into card values('Reflex','Uncommon','Skill','0','Unplayable. If this card is discarded from your hand, draw 1 cards.');
Insert into card values('Riddle With Holes','Uncommon','Attack','2','Deal 3 damage 5 times.');
Insert into card values('Setup','Uncommon','Skill','1','Place a card in your hand on top of your draw pile. It costs 0 until it is played.');
Insert into card values('Skewer','Uncommon','Attack','0','Deal 7 damage X times.');
Insert into card values('Tactician','Uncommon','Skill','0','Unplayable. If this card is discarded from your hand, gain 1 Energy.');
Insert into card values('Terror','Uncommon','Skill','1','Apply 99 Vulnerable. Exhaust.');
Insert into card values('Well-Laid Plans','Uncommon','Power','0','At the end of your turn, Retain up to 1 card.');
Insert into card values('A Thousand Combust','Rare','Power','2','Whenever you play a card, deal 1 damage to ALL enemies.');
Insert into card values('Adrenaline','Rare','Skill','0','Gain 1 Energy. Draw 2 cards. Exhaust.');
Insert into card values('After Image','Rare','Power','1','Whenever you play a card, gain 1 Block.');
Insert into card values('Alchemize','Rare','Skill','1','Obtain a random potion. Exhaust.');
Insert into card values('Bullet Time','Rare','Skill','3','You cannot draw additional cards this turn. Reduce the cost of cards in your hand to 0 this turn.');
Insert into card values('Burst','Rare','Skill','1','This turn your next 1 Skill is played twice.');
Insert into card values('Corpse Explosion','Rare','Skill','2','Apply 6 Poison. When the enemy dies, deal damage equal to its max HP to ALL enemies.');
Insert into card values('Die Die Die','Rare','Attack','1','Deal 13 damage to ALL enemies. Exhaust.');
Insert into card values('Doppelganger','Rare','Skill','0','Next turn, draw X cards and gain X Energy.');
Insert into card values('Envenom','Rare','Power','2','Whenever an attack deals unblocked damage, apply 1 Poison.');
Insert into card values('Glass Knife','Rare','Attack','1','Deal 8 damage twice. Glass Knifes damage is lowered by 2 this combat.');
Insert into card values('Grand Finale','Rare','Attack','0','Can only be played if there are no cards in your draw pile. Deal 50 damage to ALL enemies.');
Insert into card values('Malaise','Rare','Skill','0','Enemy loses X Strength. Apply X Weak. Exhaust.');
Insert into card values('Nightmare','Rare','Skill','3','Choose a card. Next turn, add 3 copies of that card into your hand. Exhaust.');
Insert into card values('Phantasmal Killer','Rare','Skill','2','On your next turn, your Attack damage is doubled.');
Insert into card values('Storm of Steel','Rare','Skill','2','Discard your hand. Add 1 Shiv to your hand for each card discarded.');
Insert into card values('Tools of Trades','Rare','Power','1','At the start of your turn, draw 1 card and discard 1 card.');
Insert into card values('Unload','Rare','Attack','1','Deal 14 damage. Discard all non-Attack cards.');
Insert into card values('Wraith Form','Rare','Power','3','Gain 2 Intangible. At the end of your turn, lose 1 Dexterity.');
Insert into card values('Dualcast','Starter','Skill','1','Evoke your next Orb ');
Insert into card values('Zap','Starter','Skill','1','Channel 1 Lightning');
Insert into card values('Ball Lightning','Common','Attack','1','Deal 7 damage. Channel 1 Lightning.');
Insert into card values('Barrage','Common','Attack','1','Deal 4 damage for each Channeled Orb.');
Insert into card values('Beam Cell','Common','Attack','0','Deal 3 damage and apply 1 Vulnerable.');
Insert into card values('Charge Battery','Common','Skill','1','Gain 7 Block.Next turn, gain 1 Energy.');
Insert into card values('Claw','Common','Attack','0','Deal 3 damage. All Claw cards deal 2 additional damage this combat.');
Insert into card values('Cold Snap','Common','Attack','1','Deal 6 damage. Channel 1 Frost.');
Insert into card values('Compile Driver','Common','Attack','1','Deal 7 damage. Draw 1 card for each unique Orb you have.');
Insert into card values('Coolheaded','Common','Skill','1','Channel 1 Frost.Draw 1 card.');
Insert into card values('Go for the Eyes','Common','Attack','0','Deal 3 damage. If the enemy intends to attack, apply 1 Weak.');
Insert into card values('Hologram','Common','Skill','1','Gain 3 Block. Return a card from your discard pile to your hand. Exhaust ');
Insert into card values('Leap','Common','Skill','1','Gain 9 Block.');
Insert into card values('Rebound','Common','Attack','1','Deal 9 damage. Put the next card you play this turn on top of your draw pile.');
Insert into card values('Recursion','Common','Skill','1','Evoke your next Orb. Channel the Orb that was just Evoked.');
Insert into card values('Stack','Common','Skill','1','Gain Block equal to the number of cards in your discard pile.');
Insert into card values('Steam Barrier','Common','Skill','0','Gain 6 Block. Decrease this cards Block by 1 this combat.');
Insert into card values('Streamline','Common','Attack','2','Deal 15 damage. Whenever you play this card, reduce its cost by 1 for this combat.');
Insert into card values('Sweeping Beam','Common','Attack','1','Deal 6 damage to ALL enemies. Draw 1 card.');
Insert into card values('TURBO','Common','Skill','0','Gain 2 Energy. Add a Void into your discard pile.');
Insert into card values('Aggregate','Uncommon','Skill','1','Gain 1 Energy for every 6 cards in your draw pile.');
Insert into card values('Auto-Shields','Uncommon','Skill','1','If you have 0 Block, gain 11 Block.');
Insert into card values('Blizzard','Uncommon','Attack','1','Deal damage equal to 2 times the Frost Channeled this combat to ALL enemies.');
Insert into card values('Boot Sequence','Uncommon','Skill','0','Gain 10 Block. Innate. Exhaust.');
Insert into card values('Bullseye','Uncommon','Attack','1','Deal 8 damage. Apply 1 Lock-On.');
Insert into card values('Capacitor','Uncommon','Power','1','Gain 2 Orb slots.');
Insert into card values('Chaos','Uncommon','Skill','1','Channel 1 random Orb.');
Insert into card values('Chill','Uncommon','Skill','0','Channel 1 Frost for each enemy in combat. Exhaust.');
Insert into card values('Consume','Uncommon','Skill','2','Gain 2 Focus. Lose 1 Orb Slot.');
Insert into card values('Darkness','Uncommon','Skill','1','Channel 1 Dark. ');
Insert into card values('Defragment','Uncommon','Power','1','Gain 1 Focus.');
Insert into card values('Doom and Gloom','Uncommon','Attack','2','Deal 10 damage to ALL enemies. Channel 1 Dark.');
Insert into card values('Double Energy','Uncommon','Skill','1','Double your Energy. Exhaust.');
Insert into card values('Equilibrium','Uncommon','Skill','2','Gain 13 Block. Retain your hand this turn.');
Insert into card values('FTL','Uncommon','Attack','0','Deal 5 damage. If you have played less than 3 cards this turn, draw 1 card.');
Insert into card values('Force Field','Uncommon','Skill','4','Costs 1 less Energy for each Power card played this combat. Gain 12 Block.');
Insert into card values('Fusion','Uncommon','Skill','2','Channel 1 Plasma.');
Insert into card values('Genetic Algorithm','Uncommon','Skill','1','Gain 1 Block. When played, permanently increase this cards Block by 2. Exhaust.');
Insert into card values('Glacier','Uncommon','Skill','2','Gain 7 Block. Channel 2 Frost.');
Insert into card values('Heatsinks','Uncommon','Power','1','Whenever you play a Power card, draw 1 card.');
Insert into card values('Hello World','Uncommon','Power','1','At the start of your turn, add a random Common card into your hand.');
Insert into card values('Loop','Uncommon','Power','1','At the start of your turn, trigger the passive ability of your next Orb');
Insert into card values('Melter','Uncommon','Attack','1','Remove all Block from an enemy. Deal 10 amage.');
Insert into card values('Overclock','Uncommon','Skill','0','Draw 2 cards. Add a Burn into your discard pile.');
Insert into card values('Recycle','Uncommon','Skill','1','Exhaust a card. Gain Energy equal to its cost.');
Insert into card values('Reinforced Body','Uncommon','Skill','0','Gain 7 Block X times.');
Insert into card values('Reprogram','Uncommon','Skill','0','Look at the top 4 cards of your draw pile. You may discard any of them.');
Insert into card values('Rip and Tear','Uncommon','Attack','1','Deal 7 damage to a random enemy 2 times.');
Insert into card values('Scrape','Uncommon','Attack','1','Deal 7 damage. Draw 3 cards. Discard all cards drawn this way that do not cost 0.');
Insert into card values('Self Repair','Uncommon','Power','1','At the end of combat, heal 7 HP.');
Insert into card values('Skirm','Uncommon','Skill','1','Draw 3 cards.');
Insert into card values('Static Discharge','Uncommon','Power','1','Whenever you take attack damage, Channel 1 Lightning.');
Insert into card values('Storm','Uncommon','Power','1','Whenever you play a Power, Channel 1 Lightning.');
Insert into card values('Sunder','Uncommon','Attack','3','Deal 24 damage. If this kills the enemy, gain 3 Energy.');
Insert into card values('Tempest','Uncommon','Skill','0','Channel X Lightning. Exhaust.');
Insert into card values('White Noise','Uncommon','Skill','1','Add a random Power to your hand. It costs 0 this turn. Exhaust.');
Insert into card values('All for One','Rare','Attack','2','Deal 10 damage. Put all Cost 0 cards from your discard pile into your hand.');
Insert into card values('Amplify','Rare','Skill','1','This turn, your next Power is played twice.');
Insert into card values('Biased Cognition','Rare','Power','1','Gain 4 Focus. At the start of each turn, lose 1 Focus.');
Insert into card values('Buffer','Rare','Power','2','Prevent the next time you would lose HP.');
Insert into card values('Core Surge','Rare','Attack','1','Deal 11 damage. Gain 1 Artifact. Exhaust.');
Insert into card values('Creative AI','Rare','Power','3','At the start of each turn, add a random Power card to your hand.');
Insert into card values('Echo Form','Rare','Power','3','The first card you play each turn is played twice. Ethereal.');
Insert into card values('Electrodynamics','Rare','Power','2','Lightning now hits ALL enemies. Channel 2 Lightning.');
Insert into card values('Fission','Rare','Skill','0','Remove ALL of your Orbs, gain 1 Energy and draw 1 card for each Orb removed. Exhaust.');
Insert into card values('Hyperbeam','Rare','Attack','2','Deal 26 damage to ALL enemies. Lose 3 Focus.');
Insert into card values('Machine Learning','Rare','Power','1','At the start of your turn, draw 1 additional card.');
Insert into card values('Meteor Strike','Rare','Attack','5','Deal 24 damage. Channel 3 Plasma.');
Insert into card values('Multi-cast','Rare','Skill','0','Evoke your next Orb X times.');
Insert into card values('Rainbow','Rare','Skill','2','Channel 1 Lightning, 1 Frost, and 1 Dark. Exhaust.');
Insert into card values('Reboot','Rare','Skill','0','Shuffle all of your cards into your draw pile, then draw 4 cards. Exhaust.');
Insert into card values('Seek','Rare','Skill','0','Choose a card from your draw pile and place it into your hand. Exhaust.');
Insert into card values('Thunder Strike','Rare','Attack','3','Deal 7 damage to a random enemy for each Lightning Channeled this combat.');

/* Insertar heroe */
Insert into heroe values('Ironclad','80','The remaining soldier of the Ironclads. Sold his soul to harness demonic energies.');
Insert into heroe values('Silent','70','A deadly huntress from the foglands. Eradicates foes with daggers and poisons.');
Insert into heroe values('Defect','75','A combat auromaron which became self-aware. Ancient technology allows the manipulation of Orbs.');
Insert into heroe values('Everyone','0','Everyone');

/* Insertar relic */
Insert into relic values('Burning Blood','Starter','At the end of combat, heal 6 HP.');
Insert into relic values('Ring of the Snake','Starter','At the Start of each Combat, Channel 1 Lightning.');
Insert into relic values('Bracked Core','Starter','At the end of combat, draw 2 additional cards.');
Insert into relic values('Anchor','Common','Start each combat with 10 Block.');
Insert into relic values('Ancient Tea Set','Common','Whenever you enter a Rest Site, start the next combat with 2 Energy.');
Insert into relic values('Art of War','Common','If you do not play any Attacks during your turn, gain an extra Energy next turn.');
Insert into relic values('Bag of Marbles','Common','At the start of each combat, apply 1 Vulnerable to ALL enemies.');
Insert into relic values('Bag of Preparation','Common','At the start of each combat, draw 2 additional cards.');
Insert into relic values('Blood Vial','Common','At the start of each combat, heal 2 HP.');
Insert into relic values('Bronze Scales','Common','Whenever you take damage, deal 3 damage back.');
Insert into relic values('Centennial Puzzle','Common','The first time you lose HP each combat, draw 3 cards.');
Insert into relic values('Data Disk','Common','Start each combat with 1 Focus.');
Insert into relic values('Dream Catcher','Common','Whenever you rest, you may add a card to your deck.');
Insert into relic values('Happy Flower','Common','Every 3 turns, gain 1 Energy.');
Insert into relic values('Juzu Bracalet','Common','Regular enemy combats are no longer encountered in ? rooms.');
Insert into relic values('Lantern','Common','Gain 1 Energy on the first turn of each combat.');
Insert into relic values('Maw Bank','Common','Whenever you climba floor, gain 12 Gold. No longer works when you spend any Gold at the shop.');
Insert into relic values('Oddly Somoth Stone','Common','At the start of each combat, gain 1 Dexterity.');
Insert into relic values('Omamori','Common','Negate the next 2 Curses you obtain.');
Insert into relic values('Orichalcum','Common','If you end your turn without Block, gain 6 Block.');
Insert into relic values('Pen Nib','Common','Every 10th Attack you play deals double damage.');
Insert into relic values('Potion Belt','Common','Upon pickup, gain 2 Potion slots.');
Insert into relic values('Preserved Insect','Common','Enemies in Elite rooms have 25% less HP.');
Insert into relic values('Red Skull','Common','While your HP is at below 50%, you have 3 additonal Strength.');
Insert into relic values('Regal Pillow','Common','Heal an additional 15 HP when you Rest.');
Insert into relic values('Smiling Mask','Common','The merchants card removal service now always cost 50 Gold.');
Insert into relic values('Snecko Skull','Common','Whenever you apply Poison, apply an additional 1 Poison.');
Insert into relic values('Strawberry','Common','Raise your HP by 7.');
Insert into relic values('The Boot','Common','Whenever you would deal 4 or less unblocked Attack damage, increase it to 5.');
Insert into relic values('Tiny Chest','Common','Gain 30 Gold. You have 10% more likely to find treasure in ? rooms.');
Insert into relic values('Vajra','Common','At the start of each combat, gain 1 Strength.');
Insert into relic values('War Paint','Common','Upon pick up, Upgrade 2 random Skills.');
Insert into relic values('Whetstone','Common','Upon pick up, Upgrade 2 random Attacks.');
Insert into relic values('Blue Candle','Uncommon','Curse cards can now be played. Playing a Curse will make you lose 1 HP and Exhausts the card.');
Insert into relic values('Bottled Flame','Uncommon','Upon pick up, choose an Attack. Start each combat with this card in your hand.');
Insert into relic values('Bottled Lightning','Uncommon','Upon pick up, choose an Skill. Start each combat with this card in your hand.');
Insert into relic values('Bottled Tornado','Uncommon','Upon pick up, choose an Power. Start each combat with this card in your hand.');
Insert into relic values('Darkstone Periapt','Uncommon','Whenever you obtain a Curse, increase your Max HP by 6.');
Insert into relic values('Frozen Egg','Uncommon','Whenever you add a Power card to your deck, it is Upgraded.');
Insert into relic values('Cold-Plated Cables','Uncommon','Your rightmost Orb triggers its passive an additional time.');
Insert into relic values('Gremlin Horn','Uncommon','Whenever an enemy dies, gain 1 Energy and draw 1 card.');
Insert into relic values('Kunai','Uncommon','Every time you play 3 Attacks in a single turn, gain 1 Dexterity.');
Insert into relic values('Letter Opener','Uncommon','Every time you play 3 Skills in a single turn, deal 5 damage to ALL enemies.');
Insert into relic values('Matryoshka','Uncommon','The next 2 chest you open contain 2 Relics.');
Insert into relic values('Meat on the Bone','Uncommon','If your HP is at or below 50% at the end of the combat, heal 12 HP.');
Insert into relic values('Mercury Hourglass','Uncommon','At the start of your turn, deal 3 damage to ALL enemies.');
Insert into relic values('Monlten Egg','Uncommon','Whenever you add a Attack card to your deck, it is Upgraded.');
Insert into relic values('Mummified Hand','Uncommon','Whenever you play a Power, a random card in your hand cost 0 for the turn.');
Insert into relic values('Ninja Scroll','Uncommon','Start each combat with 3 Shivs in hand.');
Insert into relic values('Ornamental Fan','Uncommon','Every time you play 3 attacks in a single turn, gain 4 Block.');
Insert into relic values('Pantograh','Uncommon','At the start of boss combats, heal 25 HP.');
Insert into relic values('Paper Krane','Uncommon','Enemies with Weak deal 40% less damage rather than 25%.');
Insert into relic values('Paper Phrog','Uncommon','Enemies with Vulnerable deal 75% less damage rather than 50%.');
Insert into relic values('Pear','Uncommon','Raise your MAX HP by 10.');
Insert into relic values('Question Card','Uncommon','On Card Rewards screens, choose from 4 cards instead of 3.');
Insert into relic values('Runic Dodecaheron','Uncommon','If your HP is full, gain 1 Energy at the start of each turn.');
Insert into relic values('Self-Forming Clay','Uncommon','Whenever you lose HP in combat, gain 3 Blocknext turn.');
Insert into relic values('Shuriken','Uncommon','Every time you play 3 Attacks in a single turn, gain 1 Strength.');
Insert into relic values('Singing Bowl','Uncommon','When adding cards to your deck, you may gain +2 Max HP instead.');
Insert into relic values('Sundial','Uncommon','Evert 3 times you shuffle your deck, gain 2 Energy.');
Insert into relic values('Symbiotic Virus','Uncommon','At the start of each combat, Channel 1 Dark.');
Insert into relic values('The Courier','Uncommon','The merchant no longer runs out of cards, relics, or potions and his prices are reduced by 20%.');
Insert into relic values('Toxic Egg','Uncommon','Whenever you add a Power card to your deck, it is Upgraded.');
Insert into relic values('Bird-Faced Urn','Rare','Whenver you play a Power, heal 2 HP.');
Insert into relic values('Calipers','Rare','At the start of your turn, lose 15 Block rather than all of your Block.');
Insert into relic values('Champion Belt','Rare','Whenever you apply Vulnerable, also apply 1 Weak.');
Insert into relic values('Charons Ashes','Rare','Whenever you Exhaust a card, deal 3 damage to ALL enemies.');
Insert into relic values('Dead Branch','Rare','Whenever you Exhaust a card, add a random card to your hand.');
Insert into relic values('Du-Vu Doll','Rare','For each Curse in your deck, start each combat with 1 additional Strength.');
Insert into relic values('Emotion Chip','Rare','At the start of each turn, if you took any damage last turn, trigger the passive ability of all your Orbs.');
Insert into relic values('Fossilized Helix','Rare','Prevent the first time you would lose HP in combat.');
Insert into relic values('Gambling Chip','Rare','At the start of each combat, discard any number of cards then draw that many.');
Insert into relic values('Ginger','Rare','You can no longer become Weakened.');
Insert into relic values('Girya','Rare','You can now gain Strength at Rest Sites. (3 times max)');
Insert into relic values('Ice Cram','Rare','Energy is now conserved between turns.');
Insert into relic values('Incense Burner','Rare','Every 6 turns, gain 1 Intangible.');
Insert into relic values('Magic Flower','Rare','Healing is 50% more effective during combat.');
Insert into relic values('Mango','Rare','Raise your Max HP by 14.');
Insert into relic values('Nunchaku','Rare','Every time you play 10 Attacks, gain 1 Energy.');
Insert into relic values('Old Coin','Rare','Gain 300 Gold.');
Insert into relic values('Peace Pipe','Rare','You can now remove cards from your deck at Rest Sites.');
Insert into relic values('Pocketwatch','Rare','Whenever you play 3 or less cards in a turn, draw 3 additional cards at the start of your next turn.');
Insert into relic values('Prayer Wheel','Rare','Normal enemies drop an additional card reward.');
Insert into relic values('Shovel','Rare','You can now Dig for loot at Rest Sites.');
Insert into relic values('Stone Calendar','Rare','At the end of turn 7, deal 52 damage to ALL enemies.');
Insert into relic values('The Specimen','Rare','Whenever an enemy dies, transfer any Poison it has to a random enemy.');
Insert into relic values('Thread and Needle','Rare','At the start of each combat, gain 4 Plated Armor.');
Insert into relic values('Tingsha','Rare','Whenever you discard a card during your turn, deal 3 damage ro a random enemy for each card discarded.');
Insert into relic values('Torii','Rare','Whenever you would recibe 5 or sell unblicjed Attack damage, reduce it to 1.');
Insert into relic values('Tough Bandages','Rare','Whenever you discard a card during your turn, gain 3 Block.');
Insert into relic values('Turnip','Rare','You can no longer become Frail.');
Insert into relic values('Unceasing Top','Rare','Whenever you have no cards in had during your turn, draw a card.');
Insert into relic values('Wing Boots','Rare','You may ignore paths when choosing the next room to travel to 3 times.');
Insert into relic values('Astrolabe','Boss','Upon pickup, cooshe and Transform 3 cards, then Upgrade them.');
Insert into relic values('Black Blood','Boss','Replaces Burning Blood. At the start of combat, heal 10 HP.');
Insert into relic values('Black Star','Boss','Elites now drop 2 Relics when defeated.');
Insert into relic values('Busted Crown','Boss','Gain 1 Energy at the start of each turn. On Card Rewards screens, you have 2 tewer cards to choose from.');
Insert into relic values('Calling Bell','Boss','Obtain 3 Curses and 3 Relics.');
Insert into relic values('Gofee Dripper','Boss','Gaun 1 Energy at the start of each turn. You can no longer Rest at Rest Sites.');
Insert into relic values('Cursed Key','Boss','Gain 1 Energy at the start of each turn. Whenever you open a non-boss chest, obtain a Curse.');
Insert into relic values('Extoplasm','Boss','Gain 1 Energy at the start of each turn. You can no longer gain Gold.');
Insert into relic values('Empty Cage','Boss','Upon pickup, remove 2 cards from your deck.');
Insert into relic values('Eternal Feather','Boss','For every 5 cards in your deck, heal 2 HP whenever you enter a Rest Site.');
Insert into relic values('Frozen Core','Boss','Replaces Cracked Core. If you end your trun with empty Orbs slots, channel 1 Frost.');
Insert into relic values('Fusion Hammer','Boss','Gain 1 Energy at the start of each trun. You can no longer Smith at Rest Sites.');
Insert into relic values('Hocering Kite','Boss','Gain 1 Energy and discard 2 cards at the start of each turn.');
Insert into relic values('Inserter','Boss','Every 2 turns, gain 1 Orb slot.');
Insert into relic values('Lizard Tail','Boss','When you would die, heal 50% of your Max HP instead (works once).');
Insert into relic values('Mark of Pain','Boss','Gain 1 Energy at the start of each turn. Start combats with 2 Wounds in your draw pile.');
Insert into relic values('Nuclear Battery','Boss','At the start of each combat, Channel 1 Plasma.');
Insert into relic values('Orrery','Boss','Choose and add 5 cards to your deck.');
Insert into relic values('Pandoras Box','Boss','Transform all Strickes and Defends.');
Insert into relic values('Philisophers Stone','Boss','Gain 1 Energy at the start of each turn. All enemies start with 1 Strength.');
Insert into relic values('Ring of the Serpent','Boss','Replaces Ring of the Snake. At the start of your turn draw 1 additional card.');
Insert into relic values('Runic Cube','Boss','Whenever you lose HP, draw 1 card.');
Insert into relic values('Runic Dome','Boss','Gain 1 Energy at the start of each turn. You can no longer see enemy Intens.');
Insert into relic values('Runic Pyramid','Boss','At the start of your turn, you no longer discard your hand.');
Insert into relic values('Snecko Eye','Boss','Draw 2 additional cards each turn. Start each combat Confused.');
Insert into relic values('Sozu','Boss','Gain 1 Energy at the start of each turn. You can no longer obtain potions.');
Insert into relic values('Tiny House','Boss','Obtain 1 potion. Gain 30 Gold. Raise your Max HP by 5. Obtain 1 Card.');
Insert into relic values('Velvet Choker','Boss','Gain 1 Energy at the start of your turn. you cannot play more than 6 cards per turn.');
Insert into relic values('White Beast Statue','Boss','Potions alwats drop after combat.');
Insert into relic values('Wrist Blade','Boss','Attacks that cost 0 deal 3 additional damage.');
Insert into relic values('Bloody Idol','Event','Whenever you gain Gold, heal 5 HP.');
Insert into relic values('Cultist Headpiece','Event','You feel more talkative.');
Insert into relic values('Enchiridion','Event','At the start of each combat, add a random Power card to your hand. It cost 0 until the end of turn.');
Insert into relic values('Face of Cleric','Event','Raise your Max HP by 1 after each combat.');
Insert into relic values('Golden Idol','Event','Enemies drop 25% more Gold.');
Insert into relic values('Gremlin Visage','Event','Start each combat with Weak.');
Insert into relic values('Mark of the Bloom','Event','You can no longer heal.');
Insert into relic values('Mutagenic Strength','Event','Start each combat with 3 Strength that is lost at the end of your turn.');
Insert into relic values('Nloths Gift','Event','Triples the chance of reciving rare cards as monster rewards.');
Insert into relic values('Nloths Hungry Face','Event','The next non-boss chest you open is empty.');
Insert into relic values('Necronomicon','Event','The first Attack played each turn that cost 2 or more is played twice. When you take this relic, become Cursed.');
Insert into relic values('Neows Lament','Event','Enemies in your first 3 combats will have 1 HP.');
Insert into relic values('Nilrys Codex','Event','At the end of each turn, you can choose 1 of 3 random cards to shuffle into your draw pile.');
Insert into relic values('Odd Mushroom','Event','When Vulnerable, take 25% more damage rather than 50%.');
Insert into relic values('Red Mask','Event','At the start of each combat, apply 1 Weak to ALL enemies.');
Insert into relic values('Spirit Poop','Event','Its unpleasant.');
Insert into relic values('Ssserpent Head','Event','Whenever you enter a ? room, gain 50 Gold.');
Insert into relic values('Waeped Tongs','Event','At the start of your turn, Upgrade a random card in yout hand for the rest of combat.');
Insert into relic values('Brimstone','Shop','At the start of your turn, gain 2 Strength and ALL enemies gain 1 Strength.');
Insert into relic values('Cauldron','Shop','When obtained, brews 5 random potions.');
Insert into relic values('Chemical X','Shop','The effects of yout cost X cards are increased by 2.');
Insert into relic values('Clockwork Souvenir','Shop','At the start of each combat, gain 1 artifact.');
Insert into relic values('Dollys Mirror','Shop','Upon pickup, obtain an additional copy of a card in your deck.');
Insert into relic values('Frozen Eye','Shop','When viewing your Draw Pile, the cards are now shown in order.');
Insert into relic values('Hand Drill','Shop','Whenever you break an enemys Block, apply 2 Vulnerable.');
Insert into relic values('Lees Waffle','Shop','Raise your Max HP by 7 and heal all of your HP.');
Insert into relic values('Meal Ticket','Shop','Whenever you enter a shop room, heal 15 HP.');
Insert into relic values('Medical Kit','Shop','Status cards can now be played. Playing a Status will Exhaust the card.');
Insert into relic values('Membership Card','Shop','50% discount on all products!');
Insert into relic values('Orange Pellets','Shop','Whenever you play a Power, Attack, and a Skill, in the same turn, remove all of your Debuffs.');
Insert into relic values('Prismatic Shard','Shop','Combat reward screens now contain colorless cards and cards from other colors.');
Insert into relic values('Runic Capacitor','Shop','Start each combat with 3 additional Orb slots.');
Insert into relic values('Sling of Courage','Shop','Start each Elite combat with 2 Strength.');
Insert into relic values('Strange Spoon','Shop','Cards which Exhaust when played will instead discard 50% of the time.');
Insert into relic values('The Abacus','Shop','Gain 6 Block whenever you shiffle your draw pile.');
Insert into relic values('Toolbox','Shop','At the start of each combat, add a random colorless card to your hand.');
Insert into relic values('Toy Ornithopter','Shop','Whenever you use a potion, heal 5 HPAt the start of each combat, apply 4 Poison to ALL enemies.');
Insert into relic values('Twisted Funnel','Shop','At the start of each combat, apply 4 Poison to ALL enemies.');

/* Insertar earn */
Insert into earn values('Burning Blood','Ironclad');
Insert into earn values('Ring of the Snake','Silent');
Insert into earn values('Bracked Core','Defect');
Insert into earn values('Anchor','Everyone');
Insert into earn values('Ancient Tea Set','Everyone');
Insert into earn values('Art of War','Everyone');
Insert into earn values('Bag of Marbles','Everyone');
Insert into earn values('Bag of Preparation','Everyone');
Insert into earn values('Blood Vial','Everyone');
Insert into earn values('Bronze Scales','Everyone');
Insert into earn values('Centennial Puzzle','Everyone');
Insert into earn values('Data Disk','Defect');
Insert into earn values('Dream Catcher','Everyone');
Insert into earn values('Happy Flower','Everyone');
Insert into earn values('Juzu Bracalet','Everyone');
Insert into earn values('Lantern','Everyone');
Insert into earn values('Maw Bank','Everyone');
Insert into earn values('Oddly Somoth Stone','Everyone');
Insert into earn values('Omamori','Everyone');
Insert into earn values('Orichalcum','Everyone');
Insert into earn values('Pen Nib','Everyone');
Insert into earn values('Potion Belt','Everyone');
Insert into earn values('Preserved Insect','Everyone');
Insert into earn values('Red Skull','Ironclad');
Insert into earn values('Regal Pillow','Everyone');
Insert into earn values('Smiling Mask','Everyone');
Insert into earn values('Snecko Skull','Silent');
Insert into earn values('Strawberry','Everyone');
Insert into earn values('The Boot','Everyone');
Insert into earn values('Tiny Chest','Everyone');
Insert into earn values('Vajra','Everyone');
Insert into earn values('War Paint','Everyone');
Insert into earn values('Whetstone','Everyone');
Insert into earn values('Blue Candle','Everyone');
Insert into earn values('Bottled Flame','Everyone');
Insert into earn values('Bottled Lightning','Everyone');
Insert into earn values('Bottled Tornado','Everyone');
Insert into earn values('Darkstone Periapt','Everyone');
Insert into earn values('Frozen Egg','Everyone');
Insert into earn values('Cold-Plated Cables','Defect');
Insert into earn values('Gremlin Horn','Everyone');
Insert into earn values('Kunai','Everyone');
Insert into earn values('Letter Opener','Everyone');
Insert into earn values('Matryoshka','Everyone');
Insert into earn values('Meat on the Bone','Everyone');
Insert into earn values('Mercury Hourglass','Everyone');
Insert into earn values('Monlten Egg','Everyone');
Insert into earn values('Mummified Hand','Everyone');
Insert into earn values('Ninja Scroll','Silent');
Insert into earn values('Ornamental Fan','Everyone');
Insert into earn values('Pantograh','Everyone');
Insert into earn values('Paper Krane','Silent');
Insert into earn values('Paper Phrog','Ironclad');
Insert into earn values('Pear','Everyone');
Insert into earn values('Question Card','Everyone');
Insert into earn values('Runic Dodecaheron','Everyone');
Insert into earn values('Self-Forming Clay','Ironclad');
Insert into earn values('Shuriken','Everyone');
Insert into earn values('Singing Bowl','Everyone');
Insert into earn values('Sundial','Everyone');
Insert into earn values('Symbiotic Virus','Defect');
Insert into earn values('The Courier','Everyone');
Insert into earn values('Toxic Egg','Everyone');
Insert into earn values('Bird-Faced Urn','Everyone');
Insert into earn values('Calipers','Everyone');
Insert into earn values('Champion Belt','Ironclad');
Insert into earn values('Charons Ashes','Ironclad');
Insert into earn values('Dead Branch','Everyone');
Insert into earn values('Du-Vu Doll','Everyone');
Insert into earn values('Emotion Chip','Defect');
Insert into earn values('Fossilized Helix','Everyone');
Insert into earn values('Gambling Chip','Everyone');
Insert into earn values('Ginger','Everyone');
Insert into earn values('Girya','Everyone');
Insert into earn values('Ice Cram','Everyone');
Insert into earn values('Incense Burner','Everyone');
Insert into earn values('Magic Flower','Ironclad');
Insert into earn values('Mango','Everyone');
Insert into earn values('Nunchaku','Everyone');
Insert into earn values('Old Coin','Everyone');
Insert into earn values('Peace Pipe','Everyone');
Insert into earn values('Pocketwatch','Everyone');
Insert into earn values('Prayer Wheel','Everyone');
Insert into earn values('Shovel','Everyone');
Insert into earn values('Stone Calendar','Everyone');
Insert into earn values('The Specimen','Silent');
Insert into earn values('Thread and Needle','Everyone');
Insert into earn values('Tingsha','Silent');
Insert into earn values('Torii','Everyone');
Insert into earn values('Tough Bandages','Silent');
Insert into earn values('Turnip','Everyone');
Insert into earn values('Unceasing Top','Everyone');
Insert into earn values('Wing Boots','Everyone');
Insert into earn values('Astrolabe','Everyone');
Insert into earn values('Black Blood','Ironclad');
Insert into earn values('Black Star','Everyone');
Insert into earn values('Busted Crown','Everyone');
Insert into earn values('Calling Bell','Everyone');
Insert into earn values('Gofee Dripper','Everyone');
Insert into earn values('Cursed Key','Everyone');
Insert into earn values('Extoplasm','Everyone');
Insert into earn values('Empty Cage','Everyone');
Insert into earn values('Eternal Feather','Everyone');
Insert into earn values('Frozen Core','Defect');
Insert into earn values('Fusion Hammer','Everyone');
Insert into earn values('Hocering Kite','Everyone');
Insert into earn values('Inserter','Defect');
Insert into earn values('Lizard Tail','Everyone');
Insert into earn values('Mark of Pain','Ironclad');
Insert into earn values('Nuclear Battery','Defect');
Insert into earn values('Orrery','Everyone');
Insert into earn values('Pandoras Box','Everyone');
Insert into earn values('Philisophers Stone','Everyone');
Insert into earn values('Ring of the Serpent','Silent');
Insert into earn values('Runic Cube','Ironclad');
Insert into earn values('Runic Dome','Everyone');
Insert into earn values('Runic Pyramid','Everyone');
Insert into earn values('Snecko Eye','Everyone');
Insert into earn values('Sozu','Everyone');
Insert into earn values('Tiny House','Everyone');
Insert into earn values('Velvet Choker','Everyone');
Insert into earn values('White Beast Statue','Everyone');
Insert into earn values('Wrist Blade','Silent');
Insert into earn values('Bloody Idol','Everyone');
Insert into earn values('Cultist Headpiece','Everyone');
Insert into earn values('Enchiridion','Everyone');
Insert into earn values('Face of Cleric','Everyone');
Insert into earn values('Golden Idol','Everyone');
Insert into earn values('Gremlin Visage','Everyone');
Insert into earn values('Mark of the Bloom','Everyone');
Insert into earn values('Mutagenic Strength','Everyone');
Insert into earn values('Nloths Gift','Everyone');
Insert into earn values('Nloths Hungry Face','Everyone');
Insert into earn values('Necronomicon','Everyone');
Insert into earn values('Neows Lament','Everyone');
Insert into earn values('Nilrys Codex','Everyone');
Insert into earn values('Odd Mushroom','Everyone');
Insert into earn values('Red Mask','Everyone');
Insert into earn values('Spirit Poop','Everyone');
Insert into earn values('Ssserpent Head','Everyone');
Insert into earn values('Waeped Tongs','Everyone');
Insert into earn values('Brimstone','Ironclad');
Insert into earn values('Cauldron','Everyone');
Insert into earn values('Chemical X','Everyone');
Insert into earn values('Clockwork Souvenir','Everyone');
Insert into earn values('Dollys Mirror','Everyone');
Insert into earn values('Frozen Eye','Everyone');
Insert into earn values('Hand Drill','Everyone');
Insert into earn values('Lees Waffle','Everyone');
Insert into earn values('Meal Ticket','Everyone');
Insert into earn values('Medical Kit','Everyone');
Insert into earn values('Membership Card','Everyone');
Insert into earn values('Orange Pellets','Everyone');
Insert into earn values('Prismatic Shard','Everyone');
Insert into earn values('Runic Capacitor','Defect');
Insert into earn values('Sling of Courage','Everyone');
Insert into earn values('Strange Spoon','Everyone');
Insert into earn values('The Abacus','Everyone');
Insert into earn values('Toolbox','Everyone');
Insert into earn values('Toy Ornithopter','Everyone');
Insert into earn values('Twisted Funnel','Silent');

/* Insertar play */
Insert into play values('Apparition','Everyone');
Insert into play values('Bite','Everyone');
Insert into play values('J.A.X','Everyone');
Insert into play values('Ritual Dagger','Everyone');
Insert into play values('Shiv','Everyone');
Insert into play values('Bandage Up','Everyone');
Insert into play values('Blind','Everyone');
Insert into play values('Dark Shackles','Everyone');
Insert into play values('Deep Breath','Everyone');
Insert into play values('Discovery','Everyone');
Insert into play values('Dramatic Entrance','Everyone');
Insert into play values('Enlightenment','Everyone');
Insert into play values('Finesse','Everyone');
Insert into play values('Flash of Steel','Everyone');
Insert into play values('Forethought','Everyone');
Insert into play values('Good Instincts','Everyone');
Insert into play values('Impatience','Everyone');
Insert into play values('Jack Of All Trades','Everyone');
Insert into play values('Madness','Everyone');
Insert into play values('Mind Blast','Everyone');
Insert into play values('Panacea','Everyone');
Insert into play values('Panic Button','Everyone');
Insert into play values('Purity','Everyone');
Insert into play values('Swift Strike','Everyone');
Insert into play values('Trip','Everyone');
Insert into play values('Apotheosis','Everyone');
Insert into play values('Chrysalis','Everyone');
Insert into play values('Hand of Greed','Everyone');
Insert into play values('Magnetism','Everyone');
Insert into play values('Master of Strategy','Everyone');
Insert into play values('Maythem','Everyone');
Insert into play values('Metamorphosis','Everyone');
Insert into play values('Panache','Everyone');
Insert into play values('Sadistic Nature','Everyone');
Insert into play values('Secret Technique','Everyone');
Insert into play values('Secret Weapon','Everyone');
Insert into play values('The Bomb','Everyone');
Insert into play values('Thinking Ahead','Everyone');
Insert into play values('Transmutation','Everyone');
Insert into play values('Violence','Everyone');
Insert into play values('Ascenders Bane','Everyone');
Insert into play values('Clumsy','Everyone');
Insert into play values('Decay','Everyone');
Insert into play values('Doubt','Everyone');
Insert into play values('Injury','Everyone');
Insert into play values('Necronomicurse','Everyone');
Insert into play values('Normality','Everyone');
Insert into play values('Panin','Everyone');
Insert into play values('Parasite','Everyone');
Insert into play values('Pride','Everyone');
Insert into play values('Regret','Everyone');
Insert into play values('Shame','Everyone');
Insert into play values('Weithe','Everyone');
Insert into play values('Burn','Everyone');
Insert into play values('Dazed','Everyone');
Insert into play values('Wound','Everyone');
Insert into play values('Slimed','Everyone');
Insert into play values('Void','Everyone');
Insert into play values('Defend','Everyone');
Insert into play values('Strike','Everyone');
Insert into play values('Bash','Ironclad');
Insert into play values('Anger','Ironclad');
Insert into play values('Armaments','Ironclad');
Insert into play values('Body Slam','Ironclad');
Insert into play values('Clash','Ironclad');
Insert into play values('Cleave','Ironclad');
Insert into play values('Clothesline','Ironclad');
Insert into play values('Flex','Ironclad');
Insert into play values('Havoc','Ironclad');
Insert into play values('Headbutt','Ironclad');
Insert into play values('Heavy Blade','Ironclad');
Insert into play values('Iron Wave','Ironclad');
Insert into play values('Perfected Strike','Ironclad');
Insert into play values('Pommel Strike','Ironclad');
Insert into play values('Shrug it Off','Ironclad');
Insert into play values('Sworf Boomerang','Ironclad');
Insert into play values('Thunderclap','Ironclad');
Insert into play values('True Grit','Ironclad');
Insert into play values('Twin Strike','Ironclad');
Insert into play values('Warcry','Ironclad');
Insert into play values('Wild Strike','Ironclad');
Insert into play values('Battle Trance','Ironclad');
Insert into play values('Blood for Blood','Ironclad');
Insert into play values('Bloodletting','Ironclad');
Insert into play values('Burning Pact','Ironclad');
Insert into play values('Carnage','Ironclad');
Insert into play values('Combust','Ironclad');
Insert into play values('Corruption','Ironclad');
Insert into play values('Disarm','Ironclad');
Insert into play values('Dropkick','Ironclad');
Insert into play values('Dual Wield','Ironclad');
Insert into play values('Entrench','Ironclad');
Insert into play values('Evolve','Ironclad');
Insert into play values('Feel No Pain','Ironclad');
Insert into play values('Fire Breathing','Ironclad');
Insert into play values('Flame Barrier','Ironclad');
Insert into play values('Ghostly Armor','Ironclad');
Insert into play values('Hemokinesis','Ironclad');
Insert into play values('Infernal Blade','Ironclad');
Insert into play values('Inflame','Ironclad');
Insert into play values('Intimidate','Ironclad');
Insert into play values('Metallicize','Ironclad');
Insert into play values('Power Through','Ironclad');
Insert into play values('Pummel','Ironclad');
Insert into play values('Rage','Ironclad');
Insert into play values('Rampage','Ironclad');
Insert into play values('Reckless Charge','Ironclad');
Insert into play values('Rupture','Ironclad');
Insert into play values('Searing Blow','Ironclad');
Insert into play values('Second Wind','Ironclad');
Insert into play values('Seeing Red','Ironclad');
Insert into play values('Sentinel','Ironclad');
Insert into play values('Sever Soul','Ironclad');
Insert into play values('Shockwave','Ironclad');
Insert into play values('Spot Weakness','Ironclad');
Insert into play values('Uppercut','Ironclad');
Insert into play values('Whirlwind','Ironclad');
Insert into play values('Barricade','Ironclad');
Insert into play values('Berserk','Ironclad');
Insert into play values('Bludgeon','Ironclad');
Insert into play values('Brutality','Ironclad');
Insert into play values('Dark Embrace','Ironclad');
Insert into play values('Demon Form','Ironclad');
Insert into play values('Double Tap','Ironclad');
Insert into play values('Exhume','Ironclad');
Insert into play values('Feed','Ironclad');
Insert into play values('Fiend Fire','Ironclad');
Insert into play values('Inmolate','Ironclad');
Insert into play values('Impervious','Ironclad');
Insert into play values('Juggernaut','Ironclad');
Insert into play values('Limit Break','Ironclad');
Insert into play values('Offering','Ironclad');
Insert into play values('Reaper','Ironclad');
Insert into play values('Neutralize','Silent');
Insert into play values('Survivor','Silent');
Insert into play values('Acrobatics','Silent');
Insert into play values('Backflip','Silent');
Insert into play values('Bane','Silent');
Insert into play values('Blade Dance','Silent');
Insert into play values('Cloack and Dagger','Silent');
Insert into play values('Dagger Spray','Silent');
Insert into play values('Dagger Throw','Silent');
Insert into play values('Deadly Poison','Silent');
Insert into play values('Deflect','Silent');
Insert into play values('Dodge and Roll','Silent');
Insert into play values('Flying Knee','Silent');
Insert into play values('Outmaneuver','Silent');
Insert into play values('Piercing Wail','Silent');
Insert into play values('Poisoned Stab','Silent');
Insert into play values('Prepared','Silent');
Insert into play values('Quick Slash','Silent');
Insert into play values('Silent','Silent');
Insert into play values('Sneaky Strike','Silent');
Insert into play values('Sucker Punch','Silent');
Insert into play values('Accuracy','Silent');
Insert into play values('All-Out Attack','Silent');
Insert into play values('Backstab','Silent');
Insert into play values('Blur','Silent');
Insert into play values('Bouncing Flask','Silent');
Insert into play values('Calculated Gamble','Silent');
Insert into play values('Caltrops','Silent');
Insert into play values('Catalyst','Silent');
Insert into play values('Choke','Silent');
Insert into play values('Concentrate','Silent');
Insert into play values('Crippling Cloud','Silent');
Insert into play values('Dash','Silent');
Insert into play values('Distraction','Silent');
Insert into play values('Endless Agony','Silent');
Insert into play values('Escape Plan','Silent');
Insert into play values('Eviscerate','Silent');
Insert into play values('Expertise','Silent');
Insert into play values('Finisher','Silent');
Insert into play values('Flechettes','Silent');
Insert into play values('Footwork','Silent');
Insert into play values('Heel Hook','Silent');
Insert into play values('Infinite Blades','Silent');
Insert into play values('Leg Sweep','Silent');
Insert into play values('Masterful Stab','Silent');
Insert into play values('Noxious Fumes','Silent');
Insert into play values('Predator','Silent');
Insert into play values('Reflex','Silent');
Insert into play values('Riddle With Holes','Silent');
Insert into play values('Setup','Silent');
Insert into play values('Skewer','Silent');
Insert into play values('Tactician','Silent');
Insert into play values('Terror','Silent');
Insert into play values('Well-Laid Plans','Silent');
Insert into play values('A Thousand Combust','Silent');
Insert into play values('Adrenaline','Silent');
Insert into play values('After Image','Silent');
Insert into play values('Alchemize','Silent');
Insert into play values('Bullet Time','Silent');
Insert into play values('Burst','Silent');
Insert into play values('Corpse Explosion','Silent');
Insert into play values('Die Die Die','Silent');
Insert into play values('Doppelganger','Silent');
Insert into play values('Envenom','Silent');
Insert into play values('Glass Knife','Silent');
Insert into play values('Grand Finale','Silent');
Insert into play values('Malaise','Silent');
Insert into play values('Nightmare','Silent');
Insert into play values('Phantasmal Killer','Silent');
Insert into play values('Storm of Steel','Silent');
Insert into play values('Tools of Trades','Silent');
Insert into play values('Unload','Silent');
Insert into play values('Wraith Form','Silent');
Insert into play values('Dualcast','Defect');
Insert into play values('Zap','Defect');
Insert into play values('Ball Lightning','Defect');
Insert into play values('Barrage','Defect');
Insert into play values('Beam Cell','Defect');
Insert into play values('Charge Battery','Defect');
Insert into play values('Claw','Defect');
Insert into play values('Cold Snap','Defect');
Insert into play values('Compile Driver','Defect');
Insert into play values('Coolheaded','Defect');
Insert into play values('Go for the Eyes','Defect');
Insert into play values('Hologram','Defect');
Insert into play values('Leap','Defect');
Insert into play values('Rebound','Defect');
Insert into play values('Recursion','Defect');
Insert into play values('Stack','Defect');
Insert into play values('Steam Barrier','Defect');
Insert into play values('Streamline','Defect');
Insert into play values('Sweeping Beam','Defect');
Insert into play values('TURBO','Defect');
Insert into play values('Aggregate','Defect');
Insert into play values('Auto-Shields','Defect');
Insert into play values('Blizzard','Defect');
Insert into play values('Boot Sequence','Defect');
Insert into play values('Bullseye','Defect');
Insert into play values('Capacitor','Defect');
Insert into play values('Chaos','Defect');
Insert into play values('Chill','Defect');
Insert into play values('Consume','Defect');
Insert into play values('Darkness','Defect');
Insert into play values('Defragment','Defect');
Insert into play values('Doom and Gloom','Defect');
Insert into play values('Double Energy','Defect');
Insert into play values('Equilibrium','Defect');
Insert into play values('FTL','Defect');
Insert into play values('Force Field','Defect');
Insert into play values('Fusion','Defect');
Insert into play values('Genetic Algorithm','Defect');
Insert into play values('Glacier','Defect');
Insert into play values('Heatsinks','Defect');
Insert into play values('Hello World','Defect');
Insert into play values('Loop','Defect');
Insert into play values('Melter','Defect');
Insert into play values('Overclock','Defect');
Insert into play values('Recycle','Defect');
Insert into play values('Reinforced Body','Defect');
Insert into play values('Reprogram','Defect');
Insert into play values('Rip and Tear','Defect');
Insert into play values('Scrape','Defect');
Insert into play values('Self Repair','Defect');
Insert into play values('Skirm','Defect');
Insert into play values('Static Discharge','Defect');
Insert into play values('Storm','Defect');
Insert into play values('Sunder','Defect');
Insert into play values('Tempest','Defect');
Insert into play values('White Noise','Defect');
Insert into play values('All for One','Defect');
Insert into play values('Amplify','Defect');
Insert into play values('Biased Cognition','Defect');
Insert into play values('Buffer','Defect');
Insert into play values('Core Surge','Defect');
Insert into play values('Creative AI','Defect');
Insert into play values('Echo Form','Defect');
Insert into play values('Electrodynamics','Defect');
Insert into play values('Fission','Defect');
Insert into play values('Hyperbeam','Defect');
Insert into play values('Machine Learning','Defect');
Insert into play values('Meteor Strike','Defect');
Insert into play values('Multi-cast','Defect');
Insert into play values('Rainbow','Defect');
Insert into play values('Reboot','Defect');
Insert into play values('Seek','Defect');
Insert into play values('Thunder Strike','Defect');

/*Actualización valores NULL */
SET SQL_SAFE_UPDATES = 0; /* Desactivado de safe update mode */
Update card
    set cost = NULL
    where nameCard in (
        'Transmutation',
        'Ascenders Bane',
        'Clumsy',
        'Decay',
        'Doubt',
        'Injury',
        'Necronomicurse',
        'Normality',
        'Panin',
        'Parasite',
        'Pride',
        'Regret',
        'Shame',
        'Weithe',
        'Burn',
        'Dazed',
        'Wound',
        'Slimed',
        'Void',
        'Whirlwind',
        'Reflex',
        'Skewer',
        'Tactician',
        'Doppelganger',
        'Malaise',
        'Reinforced Body',
        'Tempest',
        'Multi-cast'
        );

Update card
    set rarityCard = NULL
    where nameCard in (
        'Ascenders Bane',
        'Clumsy',
        'Decay',
        'Doubt',
        'Injury',
        'Necronomicurse',
        'Normality',
        'Panin',
        'Parasite',
        'Pride',
        'Regret',
        'Shame',
        'Weithe',
        'Burn',
        'Dazed',
        'Wound',
        'Slimed',
        'Void'
    );
Update heroe
    set HP = NULL
    where nameHeroe = 'Everyone';

delimiter $$
/* Vistas */
/* Reliquias de cada heroe */
drop view if exists v_relicHeroe $$
create view v_relicHeroe as select earn_nameRelic as Relic, earn_nameHeroe as Heroe from earn where earn_nameHeroe not like 'Everyone' $$

/* Cartas iniciales disponibles */
drop view if exists v_starter $$
create view v_starter as select * from card where rarityCard like 'Starter' $$


/* Procedimientos */
/* Contar numero de cartas del Heroe */
drop procedure if exists p_cardsHeroe $$
create procedure p_cardsHeroe (in par_nameHeroe varchar(10))
begin
	select count(*) from play where play_nameHeroe like par_nameHeroe;
end; $$


/* Contar el numero de cartas del tipo */
drop procedure if exists p_typeCard $$
create procedure p_typeCard (in par_typeCard varchar(10))
begin
	declare par_numTypeCardIro smallint (50);
	declare par_numTypeCardSil smallint (50);
    declare par_numTypeCardDef smallint (50);
    declare par_numTypeCard smallint (50);
    
    set par_numTypeCardIro = (select count(*) from card inner join play on nameCard = play_nameCard where play_nameHeroe like 'Ironclad' and typeCard like par_typeCard);
    set par_numTypeCardSil = (select count(*) from card inner join play on nameCard = play_nameCard where play_nameHeroe like 'Silent' and typeCard like par_typeCard);
    set par_numTypeCardDef = (select count(*) from card inner join play on nameCard = play_nameCard where play_nameHeroe like 'Defect' and typeCard like par_typeCard);
    set par_numTypeCard = par_numTypeCardIro + par_numTypeCardSil + par_numTypeCardDef;
    
    select par_numTypeCardIro as Ironclad, par_numTypeCardSil as Silent, par_numTypeCardDef as Defect, par_numTypeCard as Total;
    
end; $$


/* Mostrar las reliquias */
drop procedure if exists p_relic $$
create procedure p_relic(in par_typeRelic varchar(10))
begin
	select nameRelic, earn_nameHeroe as Heroe from relic inner join earn on nameRelic = earn_nameRelic where rarityRelic like par_typeRelic;
end; $$


/* Eliminar heroe */
drop procedure if exists p_delHeroe $$
create procedure p_delHeroe(in par_nameHeroe varchar(10))
begin
    delete from card where nameCard in (select play_nameCard from play where play_nameHeroe like par_nameHeroe);
	delete from relic where nameRelic in (select earn_nameRelic from play where earn_nameHeroe like par_nameHeroe);
    delete from heroe where nameHeroe like par_nameHeroe;
end; $$


/* Actualizar v_relicheroe */
drop procedure if exists p_updaterelicheroe $$
create procedure p_updaterelicheroe()
begin
	drop view if exists v_relicHeroe;
	create view v_relicHeroe as select earn_nameRelic as Relic, earn_nameHeroe as Heroe from earn where earn_nameHeroe not like 'Everyone';
end; $$


/* Funciones */

SET GLOBAL log_bin_trust_function_creators = 1 $$ /* Permisos para crear funciones */

/* Contar numero de Curses */
drop function if exists f_Curse $$
create function f_Curse()
	returns smallint(10)
begin

	declare par_numCurse smallint(10);
    
    set par_numCurse = (select count(*) from card where typeCard like 'Curse');
    return par_numCurse;
end; $$


/* Contar numero de Status */
drop function if exists f_Status $$
create function f_Status()
	returns smallint(10)
begin

	declare par_numStatus smallint(10);
    
    set par_numStatus = (select count(*) from card where typeCard like 'Status');
    return par_numStatus;
end; $$


/* Contar numero de cartas cost X */
drop function if exists f_costX $$
create function f_costX()
	returns smallint(10)
begin

	declare par_numcostX smallint(10);
    
    set par_numcostX = (select count(*) from card where descriptionCard like '% X %');
    return par_numcostX;
end; $$


/* Contar numero de reliquias de la tienda */
drop function if exists f_relicShop $$
create function f_relicShop()
	returns smallint(10)
begin

	declare par_numrelicShop smallint(10);
    
    set par_numrelicShop = (select count(*) from relic where rarityRelic like 'Shop');
    return par_numrelicShop;
end; $$


/* Probabilidad de que te toque una reliquia que le puede tocar a cualquiera */
drop function if exists f_probEveryoneRelic $$
create function f_probEveryoneRelic()
	returns decimal(2)
begin

	declare par_probability smallint(2);
    
	set par_probability = round(((SELECT count(*) FROM earn where earn_nameHeroe like 'Everyone')/(SELECT count(*) FROM earn))*100);
    return par_probability;
end; $$

/* Disparadores */
/* Seguridad para la tabla heroe */
drop trigger if exists t_heroe $$
create trigger t_heroe
	before delete on heroe for each row
    if (select count(*) from heroe) = 0 then
		Insert into heroe values('Ironclad','80','The remaining soldier of the Ironclads. Sold his soul to harness demonic energies.');
		Insert into heroe values('Silent','70','A deadly huntress from the foglands. Eradicates foes with daggers and poisons.');
		Insert into heroe values('Defect','75','A combat auromaron which became self-aware. Ancient technology allows the manipulation of Orbs.');
		Insert into heroe values('Everyone','0','Everyone');
	end if;
$$


/* Actualizador de la vista v_relicheroe */
drop trigger if exists t_updaterelic $$
create trigger t_updaterelicheroe
	before update on relic for each row
call p_updaterelicheroe(); 
$$


drop trigger if exists t_updateheroe $$
create trigger t_updateheroe
	before update on heroe for each row
call p_updaterelicheroe(); 
$$


/* Actualizador de earn para nuevas reliquias */
drop trigger if exists t_earn $$
create trigger t_earn
    before insert on relic for each row
    insert into earn values (new.nameRelic, 'Everyone');
$$


/* Actualizador de play para nuevas cartas */
drop trigger if exists t_play $$
create trigger t_play
    before insert on card for each row
    insert into play values (new.nameCard, 'Everyone');
$$

delimiter ;