% To discover who killed Mr. Boddy, you need to learn where each person was, and what weapon was in the room. Clues are scattered throughout the quiz (you cannot solve question 1 until all 10 are read).


% 1. To begin, you need to know the suspects. There are three men (George, John, Robert) and three women (Barbara, Christine, Yolanda). Each person was in a different room (Bathroom, Dining Room, Kitchen, Living Room, Pantry, Study). A suspected weapon was found in each room (Bag, Firearm, Gas, Knife, Poison, Rope).
% Who was found in the kitchen?

man(george). man(john). man(robert).
woman(barbara). woman(christine). woman(yolanda).
person(X):- man(X).
person(X):- woman(X).
location(bathroom). location(dining). location(kitchen). location(livingroom). location(pantry). location(study).
weapon(bag). weapon(firearm). weapon(gas). weapon(knife). weapon(poison). weapon(rope).

uniq_ppl(A,B,C,D,E,F):- person(A), person(B), person(C), person(D), person(E), person(F),  \+A=B, \+A=C, \+A=D, \+A=E, \+A=F, \+B=C, \+B=D, \+B=E, \+B=F, \+C=D, \+C=E, \+C=F, \+D=E, \+D=F, \+E=F.

space:- write(" ").
writevars(A,B,C,D,E,F):- write("["), write(A), space, write(B), space, write(C), space, write(D), space, write(E), write(F), space, write("]").

writeanswers(Bathroom, Dining, Kitchen, Livingroom, Pantry, Study, Bag, Firearm, Gas, Knife, Poison, Rope):- 
    write("Bathroom: "), write(Bathroom), nl,
    write("Dining: "), write(Dining), nl,
    write("Livingroom: "), write(Livingroom), nl, 
    write("Pantry: "), write(Pantry), nl,
    write("Study: "), write(Study), nl,
    write("Kitchen: "), write(Kitchen), nl,

    write("Knife: "), write(Knife), nl,
    write("Gas: "), write(Gas), nl,
    write("Rope: "), write(Rope), nl, 
    write("Bag: "), write(Bag), nl,
    write("Poison: "), write(Poison), nl,
    write("Firearm: "), write(Firearm), nl.
murderer(X) :-
   uniq_ppl(Bathroom, Dining, Kitchen, Livingroom, Pantry, Study),
   uniq_ppl(Bag, Firearm, Gas, Knife, Poison, Rope),

% 2. Clue 1: The man in the kitchen was not found with the rope, knife, or bag.
% Which weapon, then, which was not the firearm, was found in the kitchen?

   man(Kitchen), 
   \+Kitchen=Rope, \+Kitchen=Knife, \+Kitchen=Bag, \+Kitchen=Firearm,

% % 3. Clue 2: Barbara was either in the study or the bathroom; Yolanda was in the other.
% % Which room was Barbara found in?
    woman(Bathroom), woman(Study), \+christine=Bathroom, \+christine=Study, 
    \+barbara=Dining, \+barbara=Kitchen, \+barbara=Livingroom, \+barbara=Pantry,

% % 4. Clue 3: The person with the bag, who was not Barbara nor George, was not in the bathroom nor the dining room.
% % Who had the bag in the room with them?

    \+barbara=Bag, \+george=Bag, \+barbara=Bathroom, \+barbara=Dining, \+Bag=Bathroom, \+Bag=Dining,
   
% % 5. Clue 4: The woman with the rope was found in the study.
% % Who had the rope?
   
    woman(Rope), Rope=Study,  

% % 6. Clue 5: The weapon in the living room was found with either John or George.
% % What weapon was in the living room?
    man(Livingroom), \+Livingroom=robert,
% % 7. Clue 6: The knife was not in the dining room.
% % So where was the knife?
    \+Knife=Dining,

% % 8. Clue 7: Yolanda was not with the weapon found in the study nor the pantry.
% % What weapon was found with Yolanda?
    \+yolanda=Pantry, \+yolanda=Study,

% % 9. Clue 8: The firearm was in the room with George.
% % In which room was the firearm found?
    Firearm=george,

% % 10. It was discovered that Mr. Boddy was gassed in the pantry. The suspect found in that room was the murderer.
% % Who, then, do you point the finger towards?
Pantry=Gas, Pantry=X, write("KILLER IS :"), write(X), nl, writeanswers(Bathroom, Dining, Kitchen, Livingroom, Pantry, Study, Bag, Firearm, Gas, Knife, Poison, Rope).
