isMale(winston).
isMale(jayce).
isMale(yael).
isMale(tyshawn).
isMale(scott).
isMale(maren).
isMale(damon).
isMale(trent).
isMale(junior).
isMale(maximo).
isMale(morgan).
isMale(ahmad).
isMale(brooke).
isMale(anahi).
isMale(milton).
isMale(cash).
isMale(rayne).
isMale(danny).

isFemale(kaitlyn).
isFemale(zoey).
isFemale(kassandra).
isFemale(mia).
isFemale(karina).
isFemale(andrea).
isFemale(livia).
isFemale(beau).
isFemale(kaden).
isFemale(charity).
isFemale(felicity).
isFemale(gwendolyn).
isFemale(angelica).

isParentOf(winston, yael).
isParentOf(jayce, kassandra).
isParentOf(yael, livia).
isParentOf(yael, andrea).
isParentOf(yael, karina).
isParentOf(yael, mia).
isParentOf(yael, tyshawn).
isParentOf(yael, scott).
isParentOf(yael, anahi).
isParentOf(anahi, junior).
isParentOf(anahi, milton).
isParentOf(anahi, gwendolyn).
isParentOf(anahi, cash).
isParentOf(scott, felicity).
isParentOf(scott, danny).
isParentOf(scott, charity).
isParentOf(scott, rayne).
isParentOf(scott, brooke).
isParentOf(kaitlyn, yael).
isParentOf(zoey, kassandra).
isParentOf(kassandra, livia).
isParentOf(kassandra, andrea).
isParentOf(kassandra, karina).
isParentOf(kassandra, mia).
isParentOf(kassandra, tyshawn).
isParentOf(kassandra, scott).
isParentOf(kassandra, anahi).
isParentOf(karina, ahmad).
isParentOf(karina, kaden).
isParentOf(karina, beau).
isParentOf(karina, morgan).
isParentOf(livia, maren).
isParentOf(livia, damon).
isParentOf(livia, trent).
isParentOf(livia, angelica).
isParentOf(livia, maximo).

isFatherOf(X, Y):- isMale(X), isParentOf(X, Y).

isMotherOf(X, Y):- isFemale(X), isParentOf(X, Y).

isChildOf(X, Y):- isParentOf(Y, X).

isSonOf(X, Y):- isMale(X), isChildOf(X, Y).

isDaughterOf(X, Y):- isFemale(X), isChildOf(X, Y).

isMarriedTo(X, Y):- isChildOf(Z, X), isChildOf(Z, Y).

isHusbandOf(X, Y):- isMale(X), isMarriedTo(X, Y).

isWifeOf(X, Y):- isFemale(X), isMarriedTo(X, Y).

isGrandparentOf(X, Y):- isParentOf(X, Z), isParentOf(Z, Y).

isGrandfatherOf(X, Y):- isMale(X), isGrandparentOf(X, Y).

isGrandmotherOf(X, Y):- isFemale(X), isGrandparentOf(X, Y).

isGrandchildOf(X, Y):- isGrandparentOf(Y, X).

isGrandsonOf(X, Y):- isMale(X), isGrandchildOf(X, Y).

isGranddaughterOf(X, Y):- isFemale(X), isGrandchildOf(X, Y).

isGreatGrandparentOf(X, Y):- isParentOf(X, Z), isGrandparentOf(Z, Y).

isGreatGrandfatherOf(X, Y):- isMale(X), isGreatGrandparentOf(X, Y).

isGreatGrandmotherOf(X, Y):- isFemale(X), isGreatGrandparentOf(X, Y).

isGreatGrandchildOf(X, Y):- isGreatGrandparentOf(Y, X).

isGreatGrandsonOf(X, Y):- isMale(X), isGreatGrandchildOf(X, Y).

isGranddGranddaughterOf(X, Y):- isFemale(X), isGreatGrandchildOf(X, Y).

isSiblingOf(X, Y):- isParentOf(Z, X), isParentOf(Z, Y).

isBrotherOf(X, Y):- isMale(X), isSiblingOf(X, Y).

isSisterOf(X, Y):- isFemale(X), isSiblingOf(X, Y).

isUncleOf(X, Y):- isBrotherOf(X, Z), isParentOf(Z, Y).

isAuntOf(X, Y):- isSisterOf(X, Z), isParentOf(Z, Y).

isCousinOf(X, Y):- (isParentOf(Z, X), isUncleOf(Z, Y)); (isParentOf(Z, X), isAuntOf(Z, Y)).

isNephewOf(X, Y):- isSonOf(X, Z), isSiblingOf(Z, Y).

isNieceOf(X, Y):- isDaughterOf(X, Z), isSiblingOf(Z, Y).

isParentInLawOf(X, Y):- isParentOf(X, Z), isMarriedTo(Y, Z).

isFatherInLawOf(X, Y):- isMale(X), isParentInLawOf(X, Y).

isMotherInLawOf(X, Y):- isFemale(X), isParentInLawOf(X, Y).

isGrandparentInLawOf(X, Y):- isGrandparentOf(X, Z), isMarriedTo(Y, Z).

isGrandfatherInLawOf(X, Y):- isMale(X), isGrandparentInLawOf(X, Y).

isGrandmotherInLawOf(X, Y):- isFemale(X), isGrandparentInLawOf(X, Y).

isGreatGrandparentInLawOf(X, Y):- isGrandparentOf(X, Z), isMarriedTo(Y, Z).

isGreatGrandfatherInLawOf(X, Y):- isMale(X), isGreatGrandparentInLawOf(X, Y).

isGreatGrandmotherInLawOf(X, Y):- isFemale(X), isGreatGrandparentInLawOf(X, Y).

isSiblingInLawOf(X, Y):- isSiblingOf(X, Z), isMarriedTo(Y, Z).

isBrotherInLawOf(X, Y):- isMale(X), isSiblingInLawOf(X, Y).

isSisterInLawOf(X, Y):- isFemale(X), isSiblingInLawOf(X, Y).

isUncleInLawOf(X, Y):- isUncleOf(X, Z), isMarriedTo(Y, Z).

isAuntInLawOf(X, Y):- isAuntOf(X, Z), isMarriedTo(Y, Z).

isCousinInLawOf(X, Y):- isCousinOf(X, Z), isMarriedTo(Y, Z).

isNephewInLawOf(X, Y):- isNephewOf(X, Z), isMarriedTo(Y, Z).

isNieceInLawOf(X, Y):- isNieceOf(X, Z), isMarriedTo(Y, Z).