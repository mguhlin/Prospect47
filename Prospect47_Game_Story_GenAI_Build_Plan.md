# Prospect 47
## Browser-Based Asteroid Mining, Crafting, Exploration, Modding, and Colony-Building Game
### Story Bible + Game Design + GenAI Construction Plan

> **Tagline:** Dig. Craft. Build. Prepare for Tomorrow.

> **Core promise:** Land alone on a barren asteroid, survey its geology, mine and process resources, discover Aetherium Crystal, build humanity's first permanent asteroid habitat, and prepare Prospect 47 for the arrival of the colony ship *Horizon*.

---

# 1. Project Vision

**Prospect 47** is an original voxel-based science-fiction sandbox and story game built on the open-source Luanti engine and designed to run in a modern web browser.

The player is the first Pathfinder sent into the asteroid belt ahead of a colony expedition.

The game combines:

- Asteroid exploration
- Voxel digging and construction
- Geological surveying
- Mineral discovery
- Crafting and industrial processing
- Habitat construction
- Power and life-support systems
- NPC colonists
- A helper robot named Scout
- Story missions
- A visual mission map
- Space travel
- Mods
- Screenshots and photo missions
- Procedural worlds
- Local browser saves
- World import and export
- Optional cooperative multiplayer

The central game loop is:

**Explore → Survey → Dig → Discover → Process → Craft → Build → Expand**

The emotional progression is equally important:

**Alone → Established → Connected → Responsible → Home**

The first major player experience should be:

> Open a webpage, land on Prospect 47, meet Scout, mine useful resources, discover Aetherium Crystal, build a functioning habitat, photograph your progress, save the world locally, and eventually watch the *Horizon* arrive with the first colonists.

---

# 2. What Makes Prospect 47 Its Own Game

Prospect 47 should not become "Minecraft in space."

Its identity should come from:

- Asteroid geology
- Prospecting and surveying
- Building a settlement before the colonists arrive
- Industrial crafting rather than pocket-only crafting
- Aetherium Crystal
- The relationship between the Pathfinder and Scout
- A visible colony-growth arc
- Scientific discovery
- Browser-first play
- Modding
- Photography
- A story map that turns the asteroid into a sequence of memorable places

Voxel terrain, mining, crafting, inventories, procedural worlds, and building are general game concepts.

Prospect 47 must have its own:

- Code
- Textures
- Models
- Sounds
- Music
- Characters
- Dialogue
- UI
- Resource progression
- Crafting recipes
- Mission structure
- World names
- Lore
- Building designs
- Art direction

---

# 3. Copyright, Licensing, and Identity Guardrails

## Use

- Luanti and its documented APIs
- Original Lua game code
- Original browser wrapper code
- Original textures
- Original models
- Original audio
- Original NPCs
- Original missions
- Original crafting recipes
- Original worlds
- Properly licensed open-source libraries
- Properly licensed compatible Luanti mods

## Do Not Copy

Do not copy or extract assets from Minecraft or another commercial game.

Avoid copying:

- Textures
- Models
- Sounds
- Music
- Source code
- Logos
- UI graphics
- Distinctive fictional characters
- Distinctive fictional materials
- Exact crafting recipes
- Maps
- Menu layouts
- Story text
- Screenshots as production assets

## Naming

The public project title is:

# Prospect 47

Before a public commercial or large-scale release, perform a final name-clearance check covering:

- Web search
- Game stores
- GitHub
- App stores
- Relevant domains
- USPTO records
- Similar game titles and marks

Do not claim the name is legally cleared until that work is complete.

## Aetherium

The fictional strategic resource is:

# Aetherium Crystal

Do not use "Dilithium."

## Recommended Licensing Structure

Engine modifications should follow Luanti's applicable license requirements.

Suggested project structure:

- Original Prospect 47 code: MIT
- Original documentation/media: CC BY 4.0 or another deliberately selected open-content license
- Third-party components: retain original licenses

Maintain:

```text
LICENSES/
├── LUANTI-LICENSE.txt
├── PROSPECT47-CODE-MIT.txt
├── PROSPECT47-ASSETS.txt
└── THIRD-PARTY.md
```

Maintain an asset inventory:

| Asset | Creator | Source | License | Modified |
|---|---|---|---|---|
| Example texture | Prospect 47 team | Original | CC BY 4.0 | No |

Never add an outside asset until its source and license are known.

---

# 4. The Setting

## The Year 2187

Humanity can reach the asteroid belt.

Living there is another problem.

Earth's **Frontier Settlement Initiative** has identified dozens of asteroids that might support permanent human settlements. Robotic probes have photographed their surfaces and estimated their composition, but orbital scans cannot reveal everything hidden inside them.

The first Pathfinder mission is sent ahead of the colony.

The destination is:

# Prospect 47

Official surveys classify Prospect 47 as an ordinary carbon-rich asteroid containing useful metals and probable subsurface ice.

It is supposed to be a practical destination.

Nothing more.

The Pathfinder travels aboard a small vessel called:

# Wayfarer

Wayfarer carries:

- One compact emergency habitat
- One portable fabricator
- Basic mining tools
- Geological scanners
- Construction supplies
- Limited life-support reserves
- Survey equipment
- A small exploration robot

The robot is:

# Scout

Meanwhile, the colony ship **Horizon** remains near Earth.

It will not begin its journey until Prospect 47 proves capable of supporting human life.

The mission instructions are simple:

> Land. Survey. Build a home.

Then the asteroid produces a reading nobody expected.

---

# 5. Aetherium Crystal

Deep beneath Prospect 47 is a previously unknown crystalline material.

Mission scientists name it:

# Aetherium Crystal

Aetherium can stabilize extremely high-energy fields.

Potential applications include:

- Advanced generators
- Compact energy storage
- High-output industrial equipment
- Deep-space propulsion
- Long-range exploration vessels

Ordinary minerals allow humanity to **live** in space.

Aetherium may allow humanity to travel much farther **through** it.

Aetherium connects:

- Exploration
- Mining
- Research
- The first colony
- The *Horizon*
- Later asteroid missions
- Advanced technology
- The larger mystery of the asteroid belt

Aetherium must remain rare enough that finding it always feels important.

---

# 6. Campaign One: A New Frontier

Campaign One should function as both story and tutorial.

The player learns the game by solving the problems required to establish the first settlement.

The campaign areas are:

```text
                    [1]
               LANDING ZONE
                     │
                     ▼
                    [2]
                SURVEY RIDGE
                     │
           ┌─────────┴─────────┐
           ▼                   ▼
          [3]                 [4]
      IRON HOLLOW        CRYSTAL CAVERN
           │                   │
           └─────────┬─────────┘
                     ▼
                    [5]
              BUILD THE DOME
                     │
                     ▼
                    [6]
             AETHERIUM CORE
                     │
                     ▼
                    [7]
             WELCOME COLONISTS
```

The first campaign should target roughly **30–60 minutes** in an early release, with room to expand later.

---

# 7. Area One: Landing Zone
## Story: One Person and One Robot

Wayfarer begins its final descent toward Prospect 47.

There is no landing pad.

No communications tower.

No habitat.

No welcoming committee.

Only gray rock turning slowly beneath a field of stars.

Scout activates beside the player.

> **SCOUT:** Surface stability within acceptable limits. Probability that anyone has stood here before: approximately zero.

Wayfarer touches down.

For the first time, a human stands on Prospect 47.

The player steps outside.

The asteroid is silent.

Everything humanity needs here will have to be built.

## Objectives

- Exit Wayfarer
- Activate Scout
- Establish a communications beacon
- Collect loose surface material
- Locate iron
- Mine the first blocks
- Build a storage crate
- Place emergency lighting
- Construct a temporary shelter

## Mechanics Introduced

- Movement
- Mouse look
- Digging
- Block placement
- Inventory
- Simple crafting
- Scanner
- Scout
- SpaceCam screenshots

## Story Event

The communications beacon activates.

> **MISSION CONTROL:** Pathfinder, telemetry received. Prospect 47 is officially active. Begin settlement operations.

## Reward

**Portable Fabricator**

## Photo Mission

### First Footprints

Capture a SpaceCam image containing:

- Wayfarer
- The first shelter
- Prospect 47's horizon

---

# 8. Area Two: Survey Ridge
## Story: Something Below

The settlement cannot survive on metal alone.

It needs water.

Scout identifies a ridge where orbital scans suggest subsurface ice may exist.

The player climbs toward Survey Ridge and deploys scanning equipment.

The scanner confirms several useful deposits:

- Iron
- Copper
- Silicon
- Water ice

Then a second signal appears.

Purple.

Far below the surface.

Scout scans it again.

> **SCOUT:** Unknown crystalline signature detected approximately 140 meters below surface.

Mission Control cannot identify the reading.

The anomaly is marked for later investigation.

## Objectives

- Reach Survey Ridge
- Construct three survey markers
- Scan nearby terrain
- Locate water ice
- Map mineral deposits
- Identify stable construction ground
- Mark the unknown signal
- Build a communications relay

## Mechanics Introduced

- Mapping
- Waypoints
- Resource scanning
- Geological layers
- Navigation
- Longer-distance exploration

## Story Event

> **MISSION CONTROL:** We see the anomaly. Do not prioritize it. Water and structural materials come first.

Scout quietly keeps the purple marker visible on the player's map.

## Reward

**Advanced Geological Scanner**

---

# 9. Area Three: Iron Hollow
## Story: Building Takes Metal

The future colony currently exists as blueprints.

Blueprints cannot hold oxygen.

Prospect 47 needs structural metal.

Survey results identify a rich metallic formation beneath a crater now called **Iron Hollow**.

There is enough material here to construct the settlement, but mining everything by hand would take months.

The Pathfinder has to move from exploration to industry.

## Objectives

- Reach Iron Hollow
- Mine iron
- Locate nickel
- Locate copper
- Build an ore crusher
- Build a refinery
- Produce metal ingots
- Fabricate structural components
- Construct a powered drill
- Establish automated mining

## Processing Example

```text
IRON ORE
   ↓
CRUSHER
   ↓
REFINERY
   ↓
IRON INGOT
   ↓
FABRICATOR
   ↓
STRUCTURAL FRAME
```

## Mechanics Introduced

- Industrial machines
- Refining
- Advanced crafting
- Power use
- Automated mining

## Story Event

The first powered drill activates.

> **SCOUT:** Mining output increased by 638 percent.

A pause.

> **SCOUT:** I recommend additional drills.

## Reward

**Powered Mining Drill**

---

# 10. Area Four: Crystal Cavern
## Story: The Purple Signal

The signal below Survey Ridge has grown stronger.

Mission Control finally authorizes investigation.

The player digs downward.

Regolith becomes fractured rock.

Fractured rock becomes dense silicate.

The tunnel descends.

Then the mining lamp reflects purple light.

The player breaks through a wall.

A cavern opens beyond it, filled with enormous blue-violet crystalline formations.

Scout stops.

> **SCOUT:** Material absent from geological database.

The player removes a small sample.

The suit's power monitor changes immediately.

The crystal is releasing measurable energy.

## Discovery

Mission scientists classify the material as:

# Aetherium Crystal

## Objectives

- Enter Crystal Cavern
- Photograph the intact formation
- Collect a small Aetherium sample
- Construct a containment unit
- Build an analyzer
- Test the crystal
- Locate additional deposits
- Establish safe extraction procedures

## Mechanics Introduced

- Rare resources
- Deep mining
- Scientific equipment
- Research
- Hazard management
- Aetherium Crystal

## Story Event

> **MISSION CONTROL:** Pathfinder, propulsion engineering reviewed your readings. If these results hold, Aetherium could substantially increase Horizon's operating range.

The original construction mission has become something larger.

## Reward

**Aetherium Containment Technology**

---

# 11. Area Five: Build the Dome
## Story: A Place Worth Arriving At

The *Horizon* cannot leave Earth until Prospect 47 can sustain human life.

Mission Control sends an updated colonist manifest.

For the first time, the player sees names.

Engineers.

Doctors.

Scientists.

Technicians.

Families.

The people waiting for this settlement are no longer numbers in a planning document.

They are going to live inside whatever the player builds.

## Construction Requirements

### Structure

- Foundation
- Habitat dome
- Pressure walls
- Windows
- Airlocks

### Life Support

- Oxygen processor
- Water recycler
- Ice storage
- Temperature control

### Power

- Solar array
- Battery bank
- Emergency generator

### Operations

- Workshop
- Storage
- Communications
- Landing pad

## Example Habitat Progress

```text
HABITAT STATUS

Structure        ██████████ 100%
Power            ████████░░  80%
Life Support     ███████░░░  70%
Water            ██████░░░░  60%
Communications   ██████████ 100%

OVERALL          82%
```

## Story Event

The first pressure test succeeds.

Scout enters the dome.

> **SCOUT:** Atmosphere stable.

A pause.

> **SCOUT:** It feels different in here.

For the first time since landing, the player can remove the helmet inside a permanent structure.

## Reward

**Permanent Habitat**

## Photo Mission

### Home

Photograph the completed dome with Prospect 47's horizon behind it.

---

# 12. Area Six: Aetherium Core
## Story: Power the Horizon

Testing near Earth confirms the discovery.

Aetherium works.

Small samples perform far beyond conventional energy-storage materials.

But the *Horizon* needs more than laboratory data.

It needs a stabilized power system.

Prospect 47 must manufacture one.

The settlement's most ambitious engineering project begins.

## Required Components

- Titanium containment frame
- Copper induction coils
- Silicon control systems
- Cooling network
- Radiation shielding
- Refined Aetherium Crystal

## Production Chain

```text
AETHERIUM CRYSTAL
       ↓
CRYSTAL REFINER
       ↓
STABILIZED AETHERIUM
       ↓
ENERGY MATRIX
       ↓
AETHERIUM CORE
```

## Objectives

- Extract sufficient Aetherium
- Construct crystal refiner
- Produce stabilized Aetherium
- Build containment chamber
- Assemble energy matrix
- Connect cooling system
- Activate Aetherium Core
- Maintain stable output

## Mechanics Introduced

- Advanced fabrication
- Energy management
- Reactor systems
- Rare-resource processing
- High-tier power

## Story Event

The core reaches operational output.

The colony lights briefly dim.

Then the system stabilizes.

> **MISSION CONTROL:** Pathfinder, stable output confirmed.

A second message arrives.

> **MISSION CONTROL:** Horizon launch authorization granted.

## Reward

**Aetherium Technology Tier**

---

# 13. Area Seven: Welcome Colonists
## Story: They Are Coming

The *Horizon* leaves Earth.

There is nothing left to postpone.

More than one hundred colonists are now traveling toward the asteroid that was empty when the Pathfinder arrived.

The final mission is preparation.

## Objectives

- Expand oxygen production
- Add living quarters
- Complete greenhouse systems
- Establish medical facilities
- Build emergency shelters
- Expand water storage
- Finish the landing zone
- Activate navigation beacons
- Stock critical supplies

Eventually the HUD changes.

```text
HORIZON ARRIVAL

03:17:42
```

Scout detects the ship first.

A new point of light appears.

It grows.

The *Horizon* enters visual range.

Landing craft detach.

New human voices begin filling the communications channel.

## Story Event

The first transport touches down.

The airlock cycles.

The doors open.

People walk onto Prospect 47.

The empty asteroid becomes a settlement.

```text
MISSION COMPLETE

PROSPECT 47 COLONY ESTABLISHED
```

## Reward

**Asteroid Belt Access**

Campaign One ends.

The larger game begins.

---

# 14. The Colony After Campaign One

Completing the campaign changes the game instead of ending it.

Colonists become NPCs.

Buildings become occupied.

New needs emerge.

The settlement requires:

- Housing
- Power
- Food
- Research
- Transportation
- Industry
- New mines
- Additional water
- More Aetherium

The player moves from survival to expansion.

---

# 15. Key Characters

## Scout
### Pathfinder Exploration Robot

Scout arrives with the player.

Capabilities:

- Scan minerals
- Illuminate tunnels
- Mark waypoints
- Detect hazards
- Carry small items
- Help with surveys
- Photograph locations
- Report environmental readings

Scout should gradually develop personality through short dialogue without becoming overbearing.

---

## Dr. Lena Vega
### Geologist

Specialties:

- Mineral analysis
- Core samples
- Geological mapping
- Aetherium research

Her missions teach players to understand asteroid geology.

---

## Rowan Chen
### Engineer

Specialties:

- Construction
- Machinery
- Power
- Industrial upgrades

Rowan unlocks advanced construction systems.

---

## Mina Okafor
### Botanist

Specialties:

- Greenhouses
- Food production
- Oxygen
- Soil development
- Water efficiency

Completing Mina's missions visibly adds life and greenery to the colony.

---

## Sol Reyes
### Pilot

Specialties:

- Cargo
- Shuttle operations
- Asteroid travel
- Remote expeditions

Sol unlocks access to the wider asteroid belt.

---

## Ada Torres
### Technician

Specialties:

- Electronics
- Communications
- Robotics
- Power networks

Ada's missions expand Scout and automated systems.

---

# 16. The Wider Asteroid Belt

After Campaign One, the story map expands.

```text
                    PROSPECT 47
                        │
          ┌─────────────┼─────────────┐
          ▼             ▼             ▼
      EMBER ROCK    GLASSSTONE    FROSTHAVEN
          │             │             │
          └───────┐     │     ┌───────┘
                  ▼     ▼     ▼
                    THE HOLLOW
                        │
                        ▼
                    VIOLET DEEP
```

Each asteroid should offer:

- Distinct geology
- New resources
- New hazards
- Story missions
- Building opportunities
- Secrets

---

# 17. Ember Rock
## Story: The Furnace

Ember Rock experiences extreme thermal cycles.

Its exposed metal deposits are enormous.

An automated mining station operated there before the Pathfinder network expanded.

Then it stopped transmitting.

When the player arrives, the facility appears abandoned.

Some machines are still running.

## Resources

- Iron
- Nickel
- Cobalt
- Titanium

## Hazards

- Thermal vents
- Solar exposure
- Equipment overheating

## Gameplay

Players must:

- Establish cooling
- Repair machinery
- Restore power
- Mine high-value metals
- Investigate the abandoned facility

## Mystery

Who restarted part of the mining system?

---

# 18. Glassstone
## Story: The Singing Caverns

Some sections of Glassstone appear almost translucent.

Its interior contains vast silicate caverns.

Scout begins detecting vibrations through the rock.

Different crystal formations resonate at different frequencies.

Entire chambers appear to vibrate together.

## Resources

- Silicon
- Quartz
- Rare optical minerals
- Trace Aetherium

## Gameplay

Players use:

- Scanner frequencies
- Audio clues
- Geological instruments

to locate hidden chambers.

## Mystery

Some repeating resonance patterns do not seem random.

---

# 19. Frosthaven
## Story: Water Is Life

Frosthaven may become the most strategically important asteroid in the settlement network.

It contains enormous quantities of water ice.

Water supports:

- Drinking
- Oxygen
- Agriculture
- Industry
- Propellant production

Deep drilling reveals sealed pockets containing unusual chemistry.

## Resources

- Water ice
- Carbon
- Nitrogen compounds
- Ammonia

## Gameplay

Frosthaven supports:

- Large-scale water extraction
- Greenhouses
- Life-support research
- Fuel production

## Mystery

Deep samples contain complex organic molecules.

Could something once have existed here?

---

# 20. The Hollow
## Story: The Asteroid That Shouldn't Exist

Measurements suggest The Hollow has too little mass for its size.

Exploration reveals why.

Much of its interior is empty.

Huge chambers extend for kilometers.

Some are geological.

Others seem suspicious.

Several tunnels are almost perfectly straight.

Some surfaces are unusually smooth.

## Resources

- Rare metals
- Crystal deposits
- Huge construction spaces

## Gameplay

The Hollow is suited for:

- Underground settlements
- Large industrial facilities
- Exploration missions

## Mystery

Natural geology rarely produces kilometers of nearly straight tunnel.

---

# 21. Violet Deep
## Story: The Aetherium Motherlode

Every major Aetherium reading eventually points toward one region of the asteroid belt.

At its center lies Violet Deep.

The asteroid emits a faint purple glow visible from space.

Aetherium concentrations are enormous.

The crystals also behave differently.

Equipment fails.

Energy readings fluctuate.

Scout detects signals that other systems cannot.

## Resources

- Aetherium Crystal
- Iridium
- Platinum
- Unknown minerals

## Hazards

- Radiation
- Energy instability
- Equipment interference
- Deep fissures

## Mystery

Why is so much Aetherium concentrated here?

Why can Scout detect something inside it?

---

# 22. Campaign Two: The Signal

Campaign One is about building civilization.

Campaign Two is about discovering what came before it.

While investigating Violet Deep, Scout identifies a repeating signal.

It does not originate from:

- Earth
- Prospect 47
- Horizon
- Any known spacecraft

Following it reveals:

- Artificial-looking tunnels
- Geometric chambers
- Unknown alloys
- Encoded transmissions
- Strange Aetherium formations
- Abandoned structures

Do not immediately introduce visible aliens.

Let the environment tell the story.

The player should gradually reach one conclusion:

> Something was here.

The question is whether it is gone.

---

# 23. Geology System

Asteroids should contain understandable geological patterns rather than random resource confetti.

Example:

```text
SURFACE REGOLITH
       ↓
FRACTURED ROCK
       ↓
METALLIC VEINS
       ↓
SILICATE LAYER
       ↓
CRYSTAL POCKET
       ↓
DEEP CORE
```

Scanning should provide clues.

Experienced players should become better prospectors.

A player who understands geology should locate resources more efficiently than a player who digs randomly.

---

# 24. Resource Families

## Structural

- Iron
- Nickel
- Titanium
- Aluminum
- Carbon

## Electronics

- Copper
- Silicon
- Silver

## Life Support

- Water ice
- Carbon
- Nitrogen compounds

## Valuable Minerals

- Gold
- Platinum
- Iridium
- Quartz

## Strategic Resource

- Aetherium Crystal

---

# 25. Mining Tools

Suggested progression:

```text
HAND PICK
    ↓
ROCK HAMMER
    ↓
POWERED PICK
    ↓
CORE DRILL
    ↓
SONIC DRILL
    ↓
PLASMA CUTTER
    ↓
AUTOMATED EXCAVATOR
```

Different tools should perform differently on:

- Regolith
- Hard stone
- Metal
- Ice
- Crystal
- Constructed materials

---

# 26. Industrial Crafting

Advanced objects should not appear through unexplained pocket crafting.

Use industrial processing.

```text
RAW RESOURCE
      ↓
   CRUSHER
      ↓
   REFINERY
      ↓
PROCESSED MATERIAL
      ↓
  FABRICATOR
      ↓
   COMPONENT
      ↓
MACHINE / HABITAT
```

Example:

```text
COPPER ORE
    ↓
COPPER INGOT
    ↓
COPPER WIRE
    ↓
CONTROL CIRCUIT
    ↓
HABITAT CONTROL PANEL
```

---

# 27. Crafting Categories

## Tools

- Pick
- Hammer
- Drill
- Scanner
- Core sampler
- Cutter

## Construction

- Frames
- Panels
- Windows
- Doors
- Airlocks

## Industrial

- Crusher
- Refinery
- Fabricator
- Excavator
- Crane

## Life Support

- Oxygen processor
- Water recycler
- Heater
- Cooler
- Greenhouse

## Energy

- Solar panel
- Battery
- Generator
- Aetherium systems

## Transportation

- Rover
- Cargo platform
- Landing pad
- Shuttle components

---

# 28. Habitat Construction

Players should construct settlements from modular parts.

## Structural

- Floors
- Walls
- Roofs
- Domes
- Windows
- Airlocks
- Tunnels

## Infrastructure

- Wiring
- Pipes
- Lighting
- Storage
- Power grids

## Industry

- Crushers
- Refineries
- Fabricators
- Mining systems
- Cranes

## Science

- Laboratory
- Observatory
- Geological analyzer
- Aetherium research station

## Transportation

- Landing pads
- Rover garages
- Shuttle docks

---

# 29. Visible Colony Growth

The strongest reward should be transformation.

At first:

```text
ONE PATHFINDER
ONE ROBOT
ONE SHIP
ONE EMPTY ASTEROID
```

Later:

```text
MINES
POWER
PATHWAYS
HABITATS
GREENHOUSES
NPCs
SPACECRAFT
INDUSTRY
RESEARCH
```

Eventually:

```text
A LIVING COLONY
```

The player should be able to return to Survey Ridge late in the game, look down at the settlement, and remember when nothing was there.

The soundscape should change as well.

Early game:

- Footsteps
- Mining
- Scout
- Radio
- Silence

Later game:

- Machines
- Airlocks
- Rovers
- Communications
- NPC conversations
- Spacecraft
- Colony activity

---

# 30. SpaceCam

Screenshots are a first-class feature.

Default shortcut:

**F12**

Possible interface:

```text
SPACECAM

[ ] Hide HUD
[ ] Show coordinates
[ ] Show location
[ ] Show mission title

Resolution

○ Normal
● High

[ CAPTURE ]
```

After capture:

```text
SCREENSHOT SAVED

[ DOWNLOAD PNG ]
[ COPY IMAGE ]
[ VIEW GALLERY ]
```

Screenshots remain local unless the player explicitly shares them.

---

# 31. Photo Missions

Photography should occasionally become part of gameplay.

Examples:

## First Footprints

Photograph Wayfarer and the first shelter.

## Geological Survey

Photograph an exposed titanium vein.

## Crystal Research

Photograph an intact Aetherium formation before mining it.

## Home

Photograph the completed habitat dome.

## Astronomy

Capture an eclipse from Prospect 47.

## Evidence

Photograph an artificial-looking structure inside The Hollow.

---

# 32. NPC System

NPCs should support:

- Walking
- Idle behavior
- Work routines
- Dialogue
- Trading
- Missions
- Basic persistent state
- Location schedules
- Reactions to discoveries

Examples:

- Geologist spends time near the laboratory
- Engineer visits industrial equipment
- Botanist works in greenhouses
- Pilot appears near landing facilities

NPC activity should make the settlement feel increasingly alive.

---

# 33. Dynamic Events

Possible events:

## Meteor Shower

Protect exposed equipment.

## Reactor Failure

Repair power infrastructure.

## Water Discovery

A mining tunnel intersects a hidden ice reservoir.

## Crystal Surge

Aetherium readings spike unexpectedly.

## Equipment Breakdown

Production stops until repaired.

## Colony Request

Colonists require additional housing.

## Unknown Signal

Scout detects something outside mapped territory.

Events should add variation without turning the game into constant combat.

---

# 34. Story Map Interface

Use the existing Prospect 47 concept art as the visual direction.

## Header

```text
PROSPECT 47

STORY MAP

Survey. Dig. Build. Welcome the Horizon colonists.
```

## Mission Log

```text
MISSION LOG

✓ A NEW FRONTIER
✓ RESOURCE RUN
□ BUILD THE DOME
□ WELCOME COLONISTS
```

## Current Objective

```text
CURRENT OBJECTIVE

Gather minerals and
build a safe habitat.

[ VIEW OBJECTIVES ]
```

## Resource Bar

```text
RESOURCES

Ti   1,248
Fe   2,350
Cu   1,782
Si   1,090
AE      24
```

`AE` represents Aetherium Crystal.

Mission nodes should visually represent:

1. Landing Zone
2. Survey Ridge
3. Iron Hollow
4. Crystal Cavern
5. Build the Dome
6. Aetherium Core
7. Welcome Colonists

Completed locations receive clear completion markers.

Future locations remain visible but subdued.

---

# 35. Main Gameplay HUD

Actual gameplay should use a lighter interface than the story map.

Example:

```text
┌───────────────────────────────────────────────┐

 O₂ 93%        POWER 82%        HABITAT 32%

                            OBJECTIVE
                            Gather 12 Titanium


                       +


 [1] PICK
 [2] DRILL
 [3] BLOCK
 [4] SCANNER
 [5] LIGHT


 INVENTORY E                           F12 CAMERA
```

Avoid unnecessary HUD clutter.

---

# 36. Mods

Modding should become one of Prospect 47's defining features.

Possible menu:

```text
MODS

✓ Core Asteroids
✓ Space Habitats
✓ NPC Colonists
✓ Aetherium Systems
○ Advanced Robotics
○ Meteor Storms
○ Strange Worlds
```

Mods may add:

- Asteroids
- Blocks
- Minerals
- Tools
- Machines
- NPCs
- Missions
- Structures
- Spacecraft
- Story campaigns
- Decorations
- Creatures

---

# 37. Browser Mod Manager

## Version One

Ship approved bundled mods.

Players can:

- Enable
- Disable
- View dependencies
- View licenses

## Version Two

Allow compatible package import.

```text
MODS
  ↓
IMPORT MOD
  ↓
SELECT PACKAGE
  ↓
VALIDATE
  ↓
DISPLAY LICENSE
  ↓
CHECK COMPATIBILITY
  ↓
INSTALL LOCALLY
```

---

# 38. Mod Security

Never automatically trust imported packages.

Validate:

- Paths
- Filenames
- Archive structure
- Manifest
- Dependencies
- File sizes
- API requirements

Reject:

- Path traversal
- Executables
- Unsupported native libraries
- Oversized archives
- Unsafe filesystem requirements
- Unsupported networking behavior

Keep Luanti mod-security protections enabled.

---

# 39. Mod Compatibility

## GREEN

Pure Lua/content mod expected to work in browser.

## YELLOW

Uses APIs requiring browser testing.

## RED

Requires unsupported behavior such as:

- Native libraries
- Unrestricted direct filesystem access
- Unsupported sockets
- Privileged execution

---

# 40. Prospect 47 Mod SDK

Eventually publish documentation covering:

- Blocks
- Items
- Tools
- Minerals
- Recipes
- NPCs
- Asteroids
- Structures
- Missions
- Audio
- Story extensions

Create a beginner tutorial:

# Hello Rock

Goal:

A creator should be able to add an original mineral block with a small amount of Lua.

---

# 41. Workshop

Eventually add a community content browser.

Categories:

- Mods
- Asteroids
- Worlds
- NPC packs
- Missions
- Texture packs

Every package should display:

```text
PACKAGE NAME

Author
Version
License
Description
Compatibility

[ INSTALL ]
```

Never hide licensing information.

---

# 42. Game Modes

## Story Expedition

Guided campaign and narrative progression.

## Sandbox

Open exploration and settlement building.

## Creative

Unlimited materials for construction.

## Cooperative

Multiple players build the settlement together.

---

# 43. Browser Architecture

The preferred architecture is:

```text
WEB BROWSER
     │
     ▼
PROSPECT 47 LAUNCHER
     │
     ▼
LUANTI WEBASSEMBLY
     │
     ├── Prospect 47 Core
     ├── Asteroid Generator
     ├── Geology
     ├── Mining
     ├── Crafting
     ├── Industry
     ├── Habitat
     ├── Power
     ├── NPCs
     ├── Scout
     ├── Missions
     ├── Story
     ├── SpaceCam
     └── Mod Loader
```

Do not begin by rewriting the entire Luanti engine.

Begin with a browser-capable Luanti/WebAssembly proof of concept and keep Prospect 47 game logic in Lua or the browser wrapper whenever possible.

---

# 44. Browser Feasibility Gate

Before full game production, prove that the engine works reliably in the browser.

The technical prototype must:

- Load through HTTPS
- Initialize WebAssembly
- Render a Luanti world
- Accept keyboard input
- Capture pointer/mouse input
- Dig blocks
- Place blocks
- Open inventory
- Execute Lua game code
- Render textures
- Play audio
- Save world state
- Reload world state
- Capture screenshots

Primary desktop targets:

- Chrome
- Firefox
- Edge

Secondary targets:

- Safari
- Chromebooks
- Tablets
- Phones

Do not promise compatibility until it is tested.

---

# 45. Browser Test Matrix

Maintain:

| Feature | Chrome | Firefox | Edge | Safari |
|---|---|---|---|---|
| Loads | | | | |
| Keyboard | | | | |
| Mouse capture | | | | |
| Audio | | | | |
| Save world | | | | |
| Reload world | | | | |
| Screenshot | | | | |
| Fullscreen | | | | |
| Mods | | | | |

---

# 46. Persistent Browser Worlds

Closing the browser must not destroy a colony.

Preferred browser storage:

**Origin Private File System (OPFS)**

Fallback:

**IndexedDB**

Suggested local structure:

```text
Prospect47/
│
├── worlds/
├── mods/
├── screenshots/
├── saves/
└── settings/
```

Provide:

- Export world
- Import world
- Duplicate world
- Back up world
- Delete world

The player should always be able to keep a portable copy of a world.

---

# 47. Web Launcher

Create a Prospect 47 launcher instead of permanently exposing standard engine menus.

```text
PROSPECT 47

[ CONTINUE ]

[ NEW EXPEDITION ]

[ STORY MAP ]

[ SANDBOX ]

[ MODS ]

[ SCREENSHOTS ]

[ SETTINGS ]

[ ABOUT ]
```

The About screen should clearly include:

- Powered by Luanti
- Luanti license
- Prospect 47 license
- Source repository
- Third-party licenses
- Privacy information

Never imply Prospect 47 is an official Luanti product.

---

# 48. Multiplayer

Build multiplayer only after single-player is reliable.

Likely architecture:

```text
BROWSER
   │
   │ WSS
   ▼
WEBSOCKET / NETWORK BRIDGE
   │
   ▼
LUANTI SERVER
```

Begin with private cooperative expeditions rather than a public server browser.

Example:

```text
CREATE EXPEDITION

ROOM CODE

P47-X92K
```

Another player enters the code to join.

Potential cooperative activities:

- Mine together
- Survey separate regions
- Build habitats
- Operate industrial systems
- Explore dangerous locations
- Complete missions

Do not require rigid player classes.

---

# 49. Accessibility

Support:

- Remappable controls
- Keyboard-operable menus
- Visible focus indicators
- Adjustable UI scale
- Adjustable mouse sensitivity
- Reduced-motion mode
- Screen-shake toggle
- Subtitles
- Volume controls
- High-contrast UI option
- Color-independent status indicators

Suggested defaults:

```text
WASD          Move
Mouse         Look
Left Click    Dig/use
Right Click   Place/use
Space         Jump
E             Inventory
M             Map
F12           SpaceCam
Esc           Menu
```

---

# 50. Privacy

Single-player Prospect 47 should default to:

- No account
- No student information
- No required cloud storage
- No automatic screenshot upload
- No required telemetry
- No behavioral tracking

Worlds remain local.

Mods remain local.

Screenshots remain local.

Network connections should occur only when required for deliberate features such as:

- Multiplayer
- Updates
- Optional Workshop downloads

---

# 51. Performance Targets

Browser performance is a primary design constraint.

## Texture Targets

Prefer:

- 16×16
- 32×32

## Graphics Presets

```text
LOW
MEDIUM
HIGH
```

Adjust:

- View distance
- Shadows
- Particles
- Lighting
- NPC counts
- Effects

Target:

- 60 FPS where practical
- 30 FPS minimum acceptable target for supported hardware

Optimize:

- Texture atlases
- Mesh generation
- Chunk loading
- Lighting
- Particles
- NPC processing
- Audio
- WebAssembly size
- Save writes
- Lazy-loaded assets

Chromebooks should become an explicit target after desktop browsers are stable.

---

# 52. Repository Architecture

Keep engine, game, browser, networking, docs, and tests separate.

```text
prospect47/
│
├── engine/
│   └── luanti-browser/
│
├── game/
│   ├── game.conf
│   ├── mods/
│   ├── textures/
│   ├── models/
│   └── sounds/
│
├── web/
│   ├── launcher/
│   ├── storage/
│   ├── screenshot/
│   └── mod-manager/
│
├── proxy/
│   └── multiplayer/
│
├── tests/
│
├── docs/
│   ├── ARCHITECTURE.md
│   ├── STORY.md
│   ├── MODDING.md
│   ├── PRIVACY.md
│   ├── ACCESSIBILITY.md
│   └── THIRD-PARTY.md
│
└── LICENSES/
```

Avoid engine modifications when the feature can live in:

- Lua
- A game mod
- A browser wrapper

This keeps future Luanti updates manageable.

---

# 53. Prospect 47 Game Modules

Suggested structure:

```text
games/
└── prospect47/
    ├── game.conf
    │
    └── mods/
        ├── p47_core/
        ├── p47_world/
        ├── p47_geology/
        ├── p47_resources/
        ├── p47_tools/
        ├── p47_crafting/
        ├── p47_industry/
        ├── p47_habitat/
        ├── p47_power/
        ├── p47_aetherium/
        ├── p47_npcs/
        ├── p47_scout/
        ├── p47_story/
        ├── p47_missions/
        ├── p47_spacetravel/
        └── p47_spacecam/
```

Use the `p47_` namespace consistently.

---

# 54. Art Direction

Use the generated Prospect 47 concept art as the visual direction, not as a requirement to reproduce every detail exactly.

## Palette

### Space

- Deep navy
- Black
- Dark blue
- Violet nebula accents

### Interface

- Electric cyan
- Dark translucent navy
- Orange highlights
- White text

### Construction

- White
- Gray
- Orange
- Cyan illumination

### Aetherium

- Violet
- Purple
- Electric blue
- White highlights

---

# 55. Character Direction

## Pathfinder

- Fully clothed practical spacesuit
- White and gray
- Orange structural accents
- Cyan instrumentation
- Friendly but capable visual identity
- No resemblance to recognizable commercial game characters

## Scout

- Small floating robot
- Geometric body
- White-gray-orange shell
- Cyan digital face
- Small thrusters
- Expressive without looking childish

Scout should become one of the game's signature characters.

---

# 56. Habitat Direction

Habitats should feel modular and expandable.

Common elements:

- Geodesic domes
- Airlocks
- Modular corridors
- Industrial foundations
- Cranes
- Landing pads
- Solar arrays
- Greenhouses
- Communications towers

Settlement evolution:

```text
TEMPORARY SHELTER
       ↓
SMALL OUTPOST
       ↓
PRESSURIZED HABITAT
       ↓
INDUSTRIAL BASE
       ↓
LIVING COLONY
```

---

# 57. Aetherium Art Direction

Aetherium should look unmistakable.

Appearance:

- Large faceted formations
- Violet-blue core
- White highlights
- Subtle glow
- Small energy particles

Common minerals should look useful.

Aetherium should look extraordinary.

---

# 58. Major Art Assets

## Hero Art

Shows:

- Pathfinder
- Scout
- Prospect 47
- Resources
- Aetherium
- Habitat dome
- Spacecraft
- Asteroid belt

Use for:

- Landing page
- Splash screen
- Promotion

## Story Map

Shows:

- Landing Zone
- Survey Ridge
- Iron Hollow
- Crystal Cavern
- Build the Dome
- Aetherium Core
- Welcome Colonists

Use as the UI target for campaign navigation.

## Build the First Habitat

Shows:

- Pathfinder building
- Scout
- Dome
- Crane
- Resource crates
- Aetherium
- Wayfarer/cargo craft
- Future colonist facilities

Use as the visual target for the player's first mature outpost.

---

# 59. GenAI Construction Philosophy

A GenAI coding assistant should **not** be asked to create Prospect 47 in one enormous prompt.

Build the game as a sequence of independently testable vertical slices.

Every phase should follow:

```text
PLAN
  ↓
IMPLEMENT
  ↓
RUN
  ↓
TEST
  ↓
FIX
  ↓
DOCUMENT
  ↓
COMMIT
```

Rules for GenAI construction:

1. Build one complete feature before starting several partial features.
2. Prefer simple implementations over speculative frameworks.
3. Keep game logic modular.
4. Keep engine modifications minimal.
5. Never invent an engine API. Check actual Luanti APIs before using them.
6. Never silently substitute a desktop-only API for a browser-compatible solution.
7. Write tests for important state transitions.
8. Validate saves after every storage change.
9. Validate mods before loading them.
10. Keep assets and licenses documented.
11. Keep story text separate from game logic where practical.
12. Use data files for missions, resources, crafting recipes, NPC dialogue, and progression whenever possible.
13. Do not hardcode secrets.
14. Do not collect personal data.
15. Commit working milestones frequently.

---

# 60. Master Prompt for a GenAI Coding Assistant

Use this as the primary construction prompt.

```text
You are helping build Prospect 47, an original browser-based asteroid mining,
crafting, exploration, and colony-building game based on Luanti.

PROJECT GOAL

The player lands alone on Prospect 47 with a helper robot named Scout, surveys
the asteroid, mines and processes resources, discovers Aetherium Crystal,
constructs a pressurized habitat, builds an Aetherium Core, and prepares for
the arrival of the colony ship Horizon.

TECHNICAL PRIORITIES

1. Browser-first operation
2. Luanti-compatible Lua game logic
3. Minimal engine modifications
4. Local-first storage
5. No required accounts
6. No unnecessary data collection
7. Modular code
8. Strong validation and tests
9. Accessibility
10. Performance suitable for ordinary laptops and eventually Chromebooks

CODE PRINCIPLES

- Effective first
- Then efficient
- Then simple
- DRY
- KISS
- YAGNI
- Small functions
- Clear names
- Feature-based organization
- Input validation
- Error handling
- Unit tests where appropriate
- No hardcoded secrets

LEGAL/CREATIVE BOUNDARIES

Do not copy Minecraft or another commercial game's code, textures, sounds,
characters, models, maps, UI, writing, or distinctive assets.

Use only original or clearly licensed content.

The fictional strategic resource is Aetherium Crystal.

Do not use Dilithium.

GAME MODULE PREFIX

Use p47_ for Prospect 47 Lua modules.

DEVELOPMENT METHOD

Do not build the whole game at once.

For every phase:

1. State the acceptance criteria.
2. Inspect the existing repository.
3. Implement the smallest complete solution.
4. Run tests.
5. Fix failures.
6. Test manually where automation is insufficient.
7. Document what changed.
8. Stop before beginning the next phase unless instructed.

Do not declare a phase complete unless its acceptance criteria are met.
```

---

# 61. Phase Zero: Repository and Build Reproduction

## Goal

Reproduce a working browser-capable Luanti build before creating substantial Prospect 47 content.

## Tasks

- Create repository
- Add licensing files
- Add README
- Establish browser build instructions
- Establish formatting/linting
- Establish automated tests
- Reproduce browser build
- Launch an empty/test Luanti world

## Acceptance Criteria

- Browser loads the engine
- Console has no blocking startup errors
- Keyboard input works
- Pointer capture works
- World renders
- Player can move

Do not proceed until this works reliably.

---

# 62. Phase One: Touchdown Vertical Slice

## Goal

Create the smallest version that feels like Prospect 47.

Include:

- One asteroid terrain
- One player spawn
- Wayfarer landing site
- Scout placeholder/entity
- Iron
- Basic rock
- Basic mining
- Block placement
- Inventory
- Save/reload

## Acceptance Criteria

A user can:

1. Open the game in the browser
2. Spawn beside Wayfarer
3. Walk around
4. Dig rock
5. Mine iron
6. Place blocks
7. Close the browser
8. Reopen
9. See world changes preserved

This is the first critical milestone.

---

# 63. Phase Two: Survey Ridge

## Goal

Introduce exploration and geology.

Build:

- Scanner tool
- Resource markers
- Water ice
- Waypoints
- Survey objectives
- Survey Ridge location
- Purple anomaly marker
- Mission tracking

## Acceptance Criteria

The player can:

- Equip scanner
- Scan terrain
- Detect at least three resource types
- Find water ice
- Reach Survey Ridge
- Trigger the unknown Aetherium signal
- Save mission progress

---

# 64. Phase Three: Iron Hollow Industry

## Goal

Create the industrial resource loop.

Build:

- Iron ore
- Copper
- Nickel or titanium
- Crusher
- Refinery
- Fabricator
- Structural frames
- Powered drill
- Power consumption

## Acceptance Criteria

The player can complete:

```text
ORE
 ↓
CRUSH
 ↓
REFINE
 ↓
FABRICATE
 ↓
BUILD COMPONENT
```

No key construction component should appear from nowhere.

---

# 65. Phase Four: Crystal Cavern and Aetherium

## Goal

Deliver the first major story discovery.

Build:

- Crystal Cavern
- Aetherium nodes
- Aetherium glow/effects
- Analyzer
- Containment
- Research objective
- Dialogue/story triggers
- Photo objective

## Acceptance Criteria

The player can:

1. Follow the anomaly
2. Reach Crystal Cavern
3. Photograph intact Aetherium
4. Mine a sample
5. Place it in containment
6. Analyze it
7. Unlock Aetherium technology

---

# 66. Phase Five: Build the Dome

## Goal

Create the colony-building payoff.

Build:

- Modular habitat blocks
- Dome components
- Airlock
- Oxygen system
- Water system
- Power system
- Habitat status
- Pressure/safety condition
- Mission completion

## Acceptance Criteria

A habitat is considered operational only when required systems are connected.

Example checks:

```text
STRUCTURE       PASS
POWER           PASS
OXYGEN          PASS
WATER           PASS
AIRLOCK         PASS
```

The player should not complete the mission by placing one decorative block.

---

# 67. Phase Six: Aetherium Core

## Goal

Connect mining, industry, Aetherium, and story progression.

Build:

- Crystal refiner
- Stabilized Aetherium
- Energy matrix
- Containment frame
- Core construction
- Startup sequence
- Power output
- Horizon launch trigger

## Acceptance Criteria

The player must gather and manufacture the required components.

Activating the core should trigger:

- Visual/audio feedback
- Mission progression
- Horizon launch authorization

---

# 68. Phase Seven: Welcome Colonists

## Goal

Transform the world from isolated outpost to settlement.

Build:

- Arrival countdown
- Landing event
- Initial NPC colonists
- Occupied habitat
- New ambient activity
- Campaign completion
- Belt map unlock

## Acceptance Criteria

After the event:

- NPCs persist after save/reload
- New missions are available
- Colony feels visibly different
- Asteroid Belt navigation unlocks

---

# 69. Phase Eight: SpaceCam

SpaceCam can be built earlier if technically convenient, but it must be fully integrated by this phase.

## Features

- Capture canvas
- Hide HUD
- Include optional location metadata
- Download PNG
- Local gallery
- Photo mission hooks

## Acceptance Criteria

- Screenshots capture correctly
- No required upload occurs
- Player can download image
- Photo missions detect/record required capture state without sending image data externally

---

# 70. Phase Nine: Additional Asteroids

Do not create all asteroids simultaneously.

Build one complete asteroid at a time.

Recommended order:

1. Ember Rock
2. Frosthaven
3. Glassstone
4. The Hollow
5. Violet Deep

Each asteroid requires:

- Visual identity
- Geology
- Resource table
- One signature mechanic
- One story question
- At least one reason to build there

---

# 71. Phase Ten: Mods

## First Goal

Bundled mods can be enabled and disabled safely.

## Second Goal

Compatible user mods can be imported locally.

## Required Features

- Manifest
- License field
- Compatibility status
- Dependency detection
- File validation
- Size limits
- Safe failure behavior

## Acceptance Criteria

An invalid mod must fail gracefully without corrupting the world.

---

# 72. Phase Eleven: Multiplayer

Only begin when the single-player save architecture is stable.

## First Multiplayer Goal

Two browsers can join the same private expedition and see:

- Each other
- Block changes
- Basic inventory/world synchronization

Do not begin with:

- Public matchmaking
- Accounts
- Moderation systems
- Massive servers

Those are later projects.

---

# 73. Data-Driven Mission Format

Do not hardcode every mission into unrelated Lua functions.

Use structured mission data where practical.

Example conceptual schema:

```yaml
id: landing_zone
title: Landing Zone
chapter: 1
location: prospect47_landing
summary: Establish the first foothold on Prospect 47.

objectives:
  - id: activate_scout
    type: interact
    target: scout
  - id: build_beacon
    type: craft_and_place
    target: communications_beacon
  - id: mine_iron
    type: collect
    target: iron_ore
    amount: 8

completion:
  unlocks:
    - portable_fabricator
    - survey_ridge

story:
  start: landing_zone_start
  complete: landing_zone_complete
```

The exact implementation may use Lua tables, JSON, or another format suitable for the project.

The principle matters:

**Story content should be editable without rewriting the mission engine.**

---

# 74. Data-Driven Resource Format

Example conceptual resource record:

```yaml
id: aetherium_crystal
display_name: Aetherium Crystal
category: strategic
rarity: legendary
hardness: 8
tool_requirement: sonic_drill
glow: true

processing:
  input: aetherium_crystal
  machine: crystal_refiner
  output: stabilized_aetherium

uses:
  - energy_matrix
  - aetherium_core
  - advanced_propulsion
```

---

# 75. Data-Driven NPC Dialogue

Keep dialogue in separate files/tables when possible.

Example:

```yaml
speaker: scout
event: landing_zone_start

lines:
  - "Surface stability within acceptable limits."
  - "Probability that anyone has stood here before: approximately zero."
```

This makes editing story content far easier than hunting through gameplay code.

---

# 76. Validation Requirements

Every meaningful development increment should include validation.

## Engine

- Loads
- No blocking startup errors

## Game

- Dig
- Place
- Inventory
- Craft
- Mission state

## Storage

- Save
- Close
- Reload
- Compare state

## Industry

- Inputs consumed
- Outputs produced
- No duplication exploits in basic workflows

## NPCs

- Spawn
- Dialogue
- Mission state
- Save/reload

## Mods

- Valid mod works
- Invalid mod fails safely

## SpaceCam

- Capture
- Download
- Hide HUD
- Local gallery

## Multiplayer

- Join
- Movement
- Block sync
- Disconnect
- Reconnect

---

# 77. GenAI Code Review Checklist

Before accepting AI-generated code, check:

- Does it use real Luanti APIs?
- Does it actually run?
- Does it duplicate existing logic?
- Are function names understandable?
- Are modules focused?
- Is state stored in one authoritative place?
- Are errors handled?
- Are user inputs validated?
- Are files written only where expected?
- Does browser behavior match desktop assumptions?
- Does it introduce hidden network requests?
- Does it collect data?
- Are licenses documented?
- Are assets original or licensed?
- Are tests present where appropriate?
- Does save/reload still work?
- Can the code be explained by a human maintainer?

Never accept code only because it looks plausible.

---

# 78. GenAI Art Instructions

When using an image generator for Prospect 47:

- Keep every human figure fully clothed in functional space clothing
- Keep imagery classroom-appropriate
- Use original characters
- Do not imitate specific commercial game assets
- Keep text minimal
- Require clean, correctly spelled text when text is necessary
- Prefer 16:9 art for mission screens
- Prefer 4:3 or responsive crops for promotional art
- Maintain visual continuity across Pathfinder, Scout, Wayfarer, habitat, and Aetherium

## Visual Language

- Deep navy space
- Cyan UI
- White/gray/orange equipment
- Violet-blue Aetherium
- Bright but controlled lighting
- Chunky geometric/voxel forms
- Optimistic frontier science fiction

---

# 79. Art Prompt: Prospect 47 Hero

```text
Create original promotional key art for a browser-based voxel-inspired science
fiction game titled "Prospect 47."

Show a fully clothed Pathfinder astronaut standing on a rocky asteroid with a
practical mining tool. A small friendly hovering robot named Scout floats nearby.

In the background, show a growing geodesic habitat dome, construction equipment,
Wayfarer spacecraft, asteroid belt, distant planets, and resource deposits.

In the foreground, show ordinary metal ores and a spectacular cluster of
violet-blue Aetherium Crystal.

Visual style: original polished geometric/voxel science fiction, optimistic
frontier tone, deep navy space, cyan interface accents, white-gray-orange
equipment, violet-blue Aetherium.

Title text:
PROSPECT 47

Tagline:
DIG. CRAFT. BUILD. PREPARE FOR TOMORROW.

All text must be clean, professional, legible, and free of typos.
Do not copy Minecraft or another existing game's assets or exact visual style.
```

---

# 80. Art Prompt: Story Map

```text
Create an original story-map interface for the game "Prospect 47."

Set the interface in an asteroid belt with seven connected illustrated mission
nodes:

1. LANDING ZONE
2. SURVEY RIDGE
3. IRON HOLLOW
4. CRYSTAL CAVERN
5. BUILD THE DOME
6. AETHERIUM CORE
7. WELCOME COLONISTS

Show glowing paths connecting the mission locations.

Include:
- Mission Log
- Current Objective
- Story Progress
- Resource strip with Ti, Fe, Cu, Si, AE
- Pathfinder
- Scout

Header:
PROSPECT 47
STORY MAP

Subtitle:
SURVEY. DIG. BUILD. WELCOME THE HORIZON COLONISTS.

Use deep navy, cyan, orange, white, and violet.
Keep all text crisp and correctly spelled.
Use original geometric/voxel sci-fi art.
```

---

# 81. Art Prompt: Build the First Habitat

```text
Create original 16:9 mission art for "Prospect 47."

Main title:
PROSPECT 47

Mission:
BUILD THE FIRST HABITAT

Subtitle:
COLLECT MINERALS. POWER THE COLONY. PREPARE FOR THE HORIZON.

Show:
- A fully clothed Pathfinder constructing modular habitat pieces
- Scout hovering nearby
- A glowing geodesic dome under construction
- A crane
- Wayfarer or a cargo spacecraft
- Supply containers
- Titanium, iron, and copper resources
- A large violet-blue Aetherium Crystal formation
- Habitat progress display

Tone: hopeful, adventurous, constructive, and suitable for classrooms.
All text must be clean, professional, and free of typos.
Do not reference Dilithium.
```

---

# 82. First Playable Release Scope

Do not start with the complete asteroid belt.

The first playable build should contain only enough to prove the central experience.

Include:

- Prospect 47
- Wayfarer
- Pathfinder
- Scout
- Basic terrain
- 15–20 original blocks
- Iron
- Copper
- Silicon
- Titanium
- Water ice
- Aetherium Crystal
- Three mining tools
- Scanner
- Crusher
- Refinery
- Fabricator
- Small habitat system
- Mission tracking
- SpaceCam
- Persistent browser world

Success means:

> I can land, explore, survey, mine, process resources, discover Aetherium, build a small habitat, capture a screenshot, close the browser, reopen it, and continue.

---

# 83. Version Roadmap

## Prospect 47 0.1 — Touchdown

- Browser build
- Movement
- Digging
- Block placement
- Prospect 47 terrain
- Local save

## Prospect 47 0.2 — Prospector

- Scout
- Scanner
- Resource deposits
- Water ice
- Survey Ridge
- Mission tracking
- SpaceCam

## Prospect 47 0.3 — Industrial

- Crusher
- Refinery
- Fabricator
- Power
- Powered mining
- Iron Hollow

## Prospect 47 0.4 — Discovery

- Crystal Cavern
- Aetherium Crystal
- Analyzer
- Containment
- Research story

## Prospect 47 0.5 — Home

- Habitat modules
- Dome
- Oxygen
- Water
- Power
- Habitat completion logic

## Prospect 47 0.6 — Horizon

- Aetherium Core
- Arrival countdown
- Horizon
- NPC colonists
- Campaign One completion

## Prospect 47 0.7 — Belt

- Additional asteroids
- Space travel
- Expanded resource system

## Prospect 47 0.8 — Workshop

- Mod manager
- Local mod imports
- Custom content

## Prospect 47 0.9 — Together

- Cooperative multiplayer
- Private expedition rooms

## Prospect 47 1.0 — A New Frontier

Public release candidate.

---

# 84. The Minimum Complete Prospect 47 Experience

Before expanding the project, prove this sequence works:

> I open Prospect 47 in my browser.

> Wayfarer lands on the asteroid.

> Scout activates beside me.

> I walk onto an empty world.

> I scan the terrain.

> I find iron and copper.

> I discover water ice.

> I build processing machines.

> I follow Scout's unexplained purple signal.

> I enter Crystal Cavern.

> I discover Aetherium Crystal.

> I photograph it.

> I build a pressurized habitat.

> I activate life support.

> I construct an Aetherium Core.

> Horizon launches.

> Colonists arrive.

> I stand on Survey Ridge and look down at the settlement I created.

> I close the browser.

> I return later.

> Everything is still there.

That is Prospect 47.
