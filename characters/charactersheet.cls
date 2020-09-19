\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{charactersheet}[2020/09/19 LaTeX class for Star Wars RPG Character Sheets]

\LoadClass[letterpaper]{article}

\RequirePackage{tabularx}
\RequirePackage[export]{adjustbox}
\RequirePackage{../dice}
\RequirePackage[letterpaper, margin=0.5in]{geometry}
\RequirePackage{nopageno}
\RequirePackage{pgfkeys}
\RequirePackage{forloop}

\newif\ifastrogationCareer
\newif\ifathleticsCareer
\newif\ifcharmCareer
\newif\ifcoercionCareer
\newif\ifcomputersCareer
\newif\ifcoolCareer
\newif\ifcoordinationCareer
\newif\ifdeceptionCareer
\newif\ifdisciplineCareer
\newif\ifleadershipCareer
\newif\ifmechanicsCareer
\newif\ifmedicineCareer
\newif\ifnegotiationCareer
\newif\ifperceptionCareer
\newif\ifpilotingPlanetaryCareer
\newif\ifpilotingSpaceCareer
\newif\ifresilienceCareer
\newif\ifskulduggeryCareer
\newif\ifstealthCareer
\newif\ifstreetwiseCareer
\newif\ifsurvivalCareer
\newif\ifvigilanceCareer
\newif\ifbrawlCareer
\newif\ifgunneryCareer
\newif\iflightsaberCareer
\newif\ifmeleeCareer
\newif\ifrangedLightCareer
\newif\ifrangedHeavyCareer
\newif\ifcoreworldsCareer
\newif\ifeducationCareer
\newif\ifloreCareer
\newif\ifouterrimCareer
\newif\ifunderworldCareer
\newif\ifwarfareCareer
\newif\ifxenologyCareer

\pgfkeys{
    /header/.is family, /header,
        default/.style = {
            name = First Last,
            race = Human,
            gender = M/F,
            career = Smuggler,
            specializations = Pilot,
            portrait = sample_portrait,
            background = None
        },
        name/.estore in = \headerName,
        race/.estore in = \headerRace,
        gender/.estore in = \headerGender,
        career/.estore in = \headerCareer,
        specializations/.estore in = \headerSpecializations,
        portrait/.estore in = \headerPortrait,
        background/.estore in = \headerBackground,
    /attributes/.is family, /attributes,
        default/.style = {
            brawn = 2,
            agility = 2,
            intellect = 2,
            cunning = 2,
            willpower = 2,
            presence = 2,
            force = 0
        },
        brawn/.estore in = \attributesBrawn,
        agility/.estore in = \attributesAgility,
        intellect/.estore in = \attributesIntellect,
        cunning/.estore in = \attributesCunning,
        willpower/.estore in = \attributesWillpower,
        presence/.estore in = \attributesPresence,
        force/.estore in = \attributesForce,
    /combat/.is family, /combat,
        default/.style = {
            wounds = 12,
            strain = 12,
            ranged = 0,
            melee = 0,
            soak = 2
        },
        wounds/.estore in = \combatWounds,
        strain/.estore in = \combatStress,
        ranged/.estore in = \combatRanged,
        melee/.estore in = \combatMelee,
        soak/.estore in = \combatSoak,
    /weapon/.is family, /weapon,
        default/.style = {
            name = Name,
            skill = Skill,
            range = Range,
            damage = 0,
            crit = 0,
            special = None
        },
        name/.estore in = \weaponName,
        skill/.estore in = \weaponSkill,
        range/.estore in = \weaponRange,
        damage/.estore in = \weaponDamage,
        crit/.estore in = \weaponCrit,
        special/.estore in = \weaponSpecial,
    /skills/.is family, /skills,
        default/.style = {
            astrogationCareer = false,
            astrogationRank = 0,
            athleticsCareer = false,
            athleticsRank = 0,
            charmCareer = false,
            charmRank = 0,
            coercionCareer = false,
            coercionRank = 0,
            computersCareer = false,
            computersRank = 0,
            coolCareer = false,
            coolRank = 0,
            coordinationCareer = false,
            coordinationRank = 0,
            deceptionCareer = false,
            deceptionRank = 0,
            disciplineCareer = false,
            disciplineRank = 0,
            leadershipCareer = false,
            leadershipRank = 0,
            mechanicsCareer = false,
            mechanicsRank = 0,
            medicineCareer = false,
            medicineRank = 0,
            negotiationCareer = false,
            negotiationRank = 0,
            perceptionCareer = false,
            perceptionRank = 0,
            pilotingPlanetaryCareer = false,
            pilotingPlanetaryRank = 0,
            pilotingSpaceCareer = false,
            pilotingSpaceRank = 0,
            resilienceCareer = false,
            resilienceRank = 0,
            skulduggeryCareer = false,
            skulduggeryRank = 0,
            stealthCareer = false,
            stealthRank = 0,
            streetwiseCareer = false,
            streetwiseRank = 0,
            survivalCareer = false,
            survivalRank = 0,
            vigilanceCareer = false,
            vigilanceRank = 0,
            brawlCareer = false,
            brawlRank = 0,
            gunneryCareer = false,
            gunneryRank = 0,
            lightsaberCareer = false,
            lightsaberRank = 0,
            meleeCareer = false,
            meleeRank = 0,
            rangedLightCareer = false,
            rangedLightRank = 0,
            rangedHeavyCareer = false,
            rangedHeavyRank = 0,
            coreworldsCareer = false,
            coreworldsRank = 0,
            educationCareer = false,
            educationRank = 0,
            loreCareer = false,
            loreRank = 0,
            outerrimCareer = false,
            outerrimRank = 0,
            underworldCareer = false,
            underworldRank = 0,
            warfareCareer = false,
            warfareRank = 0,
            xenologyCareer = false,
            xenologyRank = 0,
        },
        astrogationCareer/.is if = astrogationCareer,
        astrogationRank/.estore in = \astrogationRank,
        athleticsCareer/.is if = athleticsCareer,
        athleticsRank/.estore in = \athleticsRank,
        charmCareer/.is if = charmCareer,
        charmRank/.estore in = \charmRank,
        coercionCareer/.is if = coercionCareer,
        coercionRank/.estore in = \coercionRank,
        computersCareer/.is if = computersCareer,
        computersRank/.estore in = \computersRank,
        coolCareer/.is if = coolCareer,
        coolRank/.estore in = \coolRank,
        coordinationCareer/.is if = coordinationCareer,
        coordinationRank/.estore in = \coordinationRank,
        deceptionCareer/.is if = deceptionCareer,
        deceptionRank/.estore in = \deceptionRank,
        disciplineCareer/.is if = disciplineCareer,
        disciplineRank/.estore in = \disciplineRank,
        leadershipCareer/.is if = leadershipCareer,
        leadershipRank/.estore in = \leadershipRank,
        mechanicsCareer/.is if = mechanicsCareer,
        mechanicsRank/.estore in = \mechanicsRank,
        medicineCareer/.is if = medicineCareer,
        medicineRank/.estore in = \medicineRank,
        negotiationCareer/.is if = negotiationCareer,
        negotiationRank/.estore in = \negotiationRank,
        perceptionCareer/.is if = perceptionCareer,
        perceptionRank/.estore in = \perceptionRank,
        pilotingPlanetaryCareer/.is if = pilotingPlanetaryCareer,
        pilotingPlanetaryRank/.estore in = \pilotingPlanetaryRank,
        pilotingSpaceCareer/.is if = pilotingSpaceCareer,
        pilotingSpaceRank/.estore in = \pilotingSpaceRank,
        resilienceCareer/.is if = resilienceCareer,
        resilienceRank/.estore in = \resilienceRank,
        skulduggeryCareer/.is if = skulduggeryCareer,
        skulduggeryRank/.estore in = \skulduggeryRank,
        stealthCareer/.is if = stealthCareer,
        stealthRank/.estore in = \stealthRank,
        streetwiseCareer/.is if = streetwiseCareer,
        streetwiseRank/.estore in = \streetwiseRank,
        survivalCareer/.is if = survivalCareer,
        survivalRank/.estore in = \survivalRank,
        vigilanceCareer/.is if = vigilanceCareer,
        vigilanceRank/.estore in = \vigilanceRank,
        brawlCareer/.is if = brawlCareer,
        brawlRank/.estore in = \brawlRank,
        gunneryCareer/.is if = gunneryCareer,
        gunneryRank/.estore in = \gunneryRank,
        lightsaberCareer/.is if = lightsaberCareer,
        lightsaberRank/.estore in = \lightsaberRank,
        meleeCareer/.is if = meleeCareer,
        meleeRank/.estore in = \meleeRank,
        rangedLightCareer/.is if = rangedLightCareer,
        rangedLightRank/.estore in = \rangedLightRank,
        rangedHeavyCareer/.is if = rangedHeavyCareer,
        rangedHeavyRank/.estore in = \rangedHeavyRank,
        coreworldsCareer/.is if = coreworldsCareer,
        coreworldsRank/.estore in = \coreworldsRank,
        educationCareer/.is if = educationCareer,
        educationRank/.estore in = \educationRank,
        loreCareer/.is if = loreCareer,
        loreRank/.estore in = \loreRank,
        outerrimCareer/.is if = outerrimCareer,
        outerrimRank/.estore in = \outerrimRank,
        underworldCareer/.is if = underworldCareer,
        underworldRank/.estore in = \underworldRank,
        warfareCareer/.is if = warfareCareer,
        warfareRank/.estore in = \warfareRank,
        xenologyCareer/.is if = xenologyCareer,
        xenologyRank/.estore in = \xenologyRank,
}

\newcommand{\makeheader}[1][]{
    \pgfkeys{/header, default, #1}

    \begin{minipage}[t]{0.8\textwidth}
        \begin{tabularx}{\textwidth}{r X r X r X}
            Name: & \headerName & Race: & \headerRace & Gender: & \headerGender \\
            Career: & \headerCareer & Specializations: & \multicolumn{3}{>{\hsize=2\hsize}X}{\headerSpecializations} \\
            Background: & \multicolumn{5}{>{\hsize=5\hsize}X}{\headerBackground}
        \end{tabularx}
    \end{minipage}
    \hfill
    \begin{minipage}[t]{0.2\textwidth}
        \raisebox{-\height+4.0\baselineskip}{
            \includegraphics[width=1\textwidth]{\headerPortrait}
        }
    \end{minipage}
}

\newcommand{\makeattributes}[1][]{
    \pgfkeys{/attributes, default, #1}

    \begin{center}
        \makebox[\textwidth][c]{\includegraphics[width=.9\paperwidth]{attributes}}
        \put(-503,33){\fontsize{24.88}{60}\selectfont \attributesBrawn}
        \put(-428,33){\fontsize{24.88}{60}\selectfont \attributesAgility}
        \put(-350,33){\fontsize{24.88}{60}\selectfont \attributesIntellect}
        \put(-275,33){\fontsize{24.88}{60}\selectfont \attributesCunning}
        \put(-200,33){\fontsize{24.88}{60}\selectfont \attributesWillpower}
        \put(-124,33){\fontsize{24.88}{60}\selectfont \attributesPresence}
        \put(-48,33){\fontsize{24.88}{60}\selectfont \attributesForce}
    \end{center}
}

\newcommand{\makecombatstats}[1][]{
    \pgfkeys{/combat, default, #1}

    \begin{center}
        \makebox[\textwidth][c]{
            \adjincludegraphics[width=.2\paperwidth, trim={0 {.5\height} {.5\width} 0}, clip]{combatstats}
            \adjincludegraphics[width=.2\paperwidth, trim={{.5\width} {.5\height} 0 0}, clip]{combatstats}
            \adjincludegraphics[width=.2\paperwidth, trim={{.5\width} 0 0 {.5\height}}, clip]{combatstats}
            \adjincludegraphics[width=.2\paperwidth, trim={0 0 {.5\width} {.5\height}}, clip]{combatstats}
        }
        \put(-495,30){\fontsize{24.88}{60}\selectfont \combatWounds}
        \put(-370,30){\fontsize{24.88}{60}\selectfont \combatStress}
        \put(-240,28){\fontsize{24.88}{60}\selectfont \combatRanged}
        \put(-192,28){\fontsize{24.88}{60}\selectfont \combatMelee}
        \put(-89,28){\fontsize{24.88}{60}\selectfont \combatSoak}
    \end{center}
}

\newenvironment{weapons}{
    \begin{center}
    \begin{tabular}{| l | l | l | l | l | l |}
    \multicolumn{6}{c}{Weapons} \\ \hline
    Name & Skill & Range & Damage & Crit & Special \\ \hline
}{
    \hline
    \end{tabular}
    \end{center}
}

\newenvironment{equipment}{
    \begin{center}
    \begin{tabular}{| l | l |}
    \multicolumn{2}{c}{Equipment} \\ \hline
    Name & Description \\ \hline
}{
    \hline
    \end{tabular}
    \end{center}
}

\newenvironment{talents}{
    \begin{center}
    \begin{tabular}{| l | l | l |}
    \multicolumn{3}{c}{Talents} \\ \hline
    Specialization & Name & Description \\ \hline
}{
    \hline
    \end{tabular}
    \end{center}
}

\newcounter{diceCounter}

\newcommand{\makeDice}[2]{
    \ifnum #1>#2
        \forloop{diceCounter}{0}{\value{diceCounter}<\the\numexpr#1-#2\relax}{\ability}\forloop{diceCounter}{0}{\value{diceCounter}<\the\numexpr#2\relax}{\proficiency}
    \else
        \forloop{diceCounter}{0}{\value{diceCounter}<\the\numexpr#2-#1\relax}{\ability}\forloop{diceCounter}{0}{\value{diceCounter}<\the\numexpr#1\relax}{\proficiency}
    \fi
}

\newcommand{\makeskills}[1][]{
    \pgfkeys{/skills, default, #1}

    \begin{center}
    \begin{tabular}{| c l c c | c l c c |}
        \hline Career & Skill & Rank & Dice & 
        Career & Skill & Rank & Dice \\ \hline
        \ifastrogationCareer $\star$ \fi & Astrogation (Int) & \astrogationRank & \makeDice{\attributesIntellect}{\astrogationRank} & 
        \multicolumn{4}{c|}{Combat} \\
        \ifathleticsCareer $\star$ \fi & Athletics (Br) & \athleticsRank & \makeDice{\attributesBrawn}{\athleticsRank} & 
        \ifbrawlCareer $\star$ \fi & Brawl (Br) & \brawlRank & \makeDice{\attributesBrawn}{\brawlRank} \\
        \ifcharmCareer $\star$ \fi & Charm (Pr) & \charmRank & \makeDice{\attributesPresence}{\charmRank} & 
        \ifgunneryCareer $\star$ \fi & Gunnery (Ag) & \gunneryRank & \makeDice{\attributesAgility}{\gunneryRank} \\
        \ifcoercionCareer $\star$ \fi & Coercion (Will) & \coercionRank & \makeDice{\attributesWillpower}{\coercionRank} & 
        \iflightsaberCareer $\star$ \fi & Lightsaber (Br) & \lightsaberRank & \makeDice{\attributesBrawn}{\lightsaberRank} \\
        \ifcomputersCareer $\star$ \fi & Computers (Int) & \computersRank & \makeDice{\attributesIntellect}{\computersRank} & 
        \ifmeleeCareer $\star$ \fi & Melee (Br) & \meleeRank & \makeDice{\attributesBrawn}{\meleeRank} \\
        \ifcoolCareer $\star$ \fi & Cool (Pr) & \coolRank & \makeDice{\attributesPresence}{\coolRank} & 
        \ifrangedLightCareer $\star$ \fi & Ranged - Light (Ag) & \rangedLightRank & \makeDice{\attributesAgility}{\rangedLightRank} \\
        \ifcoordinationCareer $\star$ \fi & Coordination (Ag) & \coordinationRank & \makeDice{\attributesAgility}{\coordinationRank} & 
        \ifrangedHeavyCareer $\star$ \fi & Ranged - Heavy (Ag) & \rangedHeavyRank & \makeDice{\attributesAgility}{\rangedHeavyRank} \\
        \ifdeceptionCareer $\star$ \fi & Deception (Cun) & \deceptionRank & \makeDice{\attributesCunning}{\deceptionRank} & 
        \multicolumn{4}{c|}{Knowledge} \\
        \ifdisciplineCareer $\star$ \fi & Discipline (Will) & \disciplineRank & \makeDice{\attributesWillpower}{\disciplineRank} & 
        \ifcoreworldsCareer $\star$ \fi & Core Worlds (Int) & \coreworldsRank & \makeDice{\attributesIntellect}{\coreworldsRank} \\
        \ifleadershipCareer $\star$ \fi & Leadership (Pr) & \leadershipRank & \makeDice{\attributesPresence}{\leadershipRank} & 
        \ifeducationCareer $\star$ \fi & Education (Int) & \educationRank & \makeDice{\attributesIntellect}{\educationRank} \\
        \ifmechanicsCareer $\star$ \fi & Mechanics (Int) & \mechanicsRank & \makeDice{\attributesIntellect}{\mechanicsRank} & 
        \ifloreCareer $\star$ \fi & Lore (Int) & \loreRank & \makeDice{\attributesIntellect}{\loreRank} \\
        \ifmedicineCareer $\star$ \fi & Medicine (Int) & \medicineRank & \makeDice{\attributesIntellect}{\medicineRank} & 
        \ifouterrimCareer $\star$ \fi & Outer Rim (Int) & \outerrimRank & \makeDice{\attributesIntellect}{\outerrimRank} \\
        \ifnegotiationCareer $\star$ \fi & Negotiation (Pr) & \negotiationRank & \makeDice{\attributesPresence}{\negotiationRank} & 
        \ifunderworldCareer $\star$ \fi & Underworld (Int) & \underworldRank & \makeDice{\attributesIntellect}{\underworldRank} \\
        \ifperceptionCareer $\star$ \fi & Perception (Cun) & \perceptionRank & \makeDice{\attributesCunning}{\perceptionRank} & 
        \ifwarfareCareer $\star$ \fi & Warfare (Int) & \warfareRank & \makeDice{\attributesIntellect}{\warfareRank} \\
        \ifpilotingPlanetaryCareer $\star$ \fi & Piloting–Planetary (Ag) & \pilotingPlanetaryRank & \makeDice{\attributesAgility}{\pilotingPlanetaryRank} & 
        \ifxenologyCareer $\star$ \fi & Xenology (Int) & \xenologyRank & \makeDice{\attributesIntellect}{\xenologyRank} \\
        \ifpilotingSpaceCareer $\star$ \fi & Piloting–Space (Ag) & \pilotingSpaceRank & \makeDice{\attributesAgility}{\pilotingSpaceRank} & 
        & & & \\
        \ifresilienceCareer $\star$ \fi & Resilience (Br) & \resilienceRank & \makeDice{\attributesBrawn}{\resilienceRank} & 
        & & & \\
        \ifskulduggeryCareer $\star$ \fi & Skulduggery (Cun) & \skulduggeryRank & \makeDice{\attributesCunning}{\skulduggeryRank} & 
        & & & \\
        \ifstealthCareer $\star$ \fi & Stealth (Ag) & \stealthRank & \makeDice{\attributesAgility}{\stealthRank} & 
        & & & \\
        \ifstreetwiseCareer $\star$ \fi & Streetwise (Cun) & \streetwiseRank & \makeDice{\attributesCunning}{\streetwiseRank} & 
        & & & \\
        \ifsurvivalCareer $\star$ \fi & Survival (Cun) & \survivalRank & \makeDice{\attributesCunning}{\survivalRank} & 
        & & & \\
        \ifvigilanceCareer $\star$ \fi & Vigilance (Will) & \vigilanceRank & \makeDice{\attributesWillpower}{\vigilanceRank} & & & & \\
        \hline
    \end{tabular}
    \end{center}
}