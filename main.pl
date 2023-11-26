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

isGrandGrandparentOf(X, Y):- isParentOf(X, Z), isGrandparentOf(Z, Y).

isGrandGrandfatherOf(X, Y):- isMale(X), isGrandGrandparentOf(X, Y).

isGrandGrandmotherOf(X, Y):- isFemale(X), isGrandGrandparentOf(X, Y).

isGrandGrandchildOf(X, Y):- isGrandGrandparentOf(Y, X).

isGrandGrandsonOf(X, Y):- isMale(X), isGrandGrandchildOf(X, Y).

isGranddGranddaughterOf(X, Y):- isFemale(X), isGrandGrandchildOf(X, Y).

isSiblingOf(X, Y):- isParentOf(Z, X), isParentOf(Z, Y).

isBrotherOf(X, Y):- isMale(X), isSiblingOf(X, Y).

isSisterOf(X, Y):- isFemale(X), isSiblingOf(X, Y).

isUncleOf(X, Y):- isBrotherOf(X, Z), isParentOf(Z, Y).

isAuntOf(X, Y):- isSisterOf(X, Z), isParentOf(Z, Y).

isCousinOf(X, Y):- (isParentOf(Z, X), isUncleOf(Z, Y)); (isParentOf(Z, X), isAuntOf(Z, Y)).

isNephewOf(X, Y):- isSonOf(X, Z), isSiblingOf(Z, Y).

isNieceOf(X, Y):- isDaughterOf(X, Z), isSiblingOf(Z, Y).