#
# M2: Intrinsic modules with relations and generators for the CAP based homalg
#
# Implementations

##
InstallMethod( CategoryOfHomalgLeftModules,
        "for a homalg ring",
        [ IsHomalgRing ],

  function( R )
    local A, SM, etaSM, LG, etaLG, Id, type_obj, type_mor, IdSM, IdLG;
    
    A := LeftPresentations( R : FinalizeCategory := false );
    
    AddImageEmbedding( A, ImageEmbeddingForLeftModules );
    
    Finalize( A );
    
    SM := FunctorStandardModuleLeft( R );
    
    etaSM := NaturalIsomorphismFromIdentityToStandardModuleLeft( R );
    
    LG := FunctorLessGeneratorsLeft( R );
    
    etaLG := NaturalIsomorphismFromIdentityToLessGeneratorsLeft( R );
    
    ## CategoryWithAmbientObject
    
    A := CategoryWithAmbientObject( A );
    
    Id := IdentityFunctor( A );
    
    SM := WithAmbientObject( SM, A );
    
    etaSM := WithAmbientObject( etaSM, Id, SM );
    
    LG := WithAmbientObject( LG, A );
    
    etaLG := WithAmbientObject( etaLG, Id, LG );
    
    type_obj :=
      NewType( TheFamilyOfIntrinsicObjects,
              IsCapCategoryIntrinsicObjectRep and
              IsFinitelyPresentedModuleRep and
              IsHomalgLeftObjectOrMorphismOfLeftObjects
              );
    
    type_mor :=
      NewType( TheFamilyOfIntrinsicMorphisms,
              IsCapCategoryIntrinsicMorphismRep and
              IsMapOfFinitelyGeneratedModulesRep and
              IsHomalgLeftObjectOrMorphismOfLeftObjects
              );
    
    ## IntrinsicCategory
    
    A := IntrinsicCategory( A, type_obj, type_mor );
    
    ## TODO: legacy
    SetFilterObj( A, IsHomalgCategory );
    A!.containers := rec( );
    
    Id := IdentityFunctor( A );
    
    SM := Intrinsify( SM, A );
    
    etaSM := Intrinsify( etaSM, Id, SM );
    
    LG := Intrinsify( LG, A );
    
    etaLG := Intrinsify( etaLG, Id, LG );
    
    ## TurnAutoequivalenceIntoIdentityFunctor
    
    IdSM := TurnAutoequivalenceIntoIdentityFunctor( etaSM );
    
    A!.IdSM := IdSM;
    
    IdLG := TurnAutoequivalenceIntoIdentityFunctor( etaLG );
    
    A!.IdLG := IdLG;
    
    return A;
    
end );

##
InstallMethod( CategoryOfHomalgRightModules,
        "for homalg ring",
        [ IsHomalgRing ],

  function( R )
    local A, SM, etaSM, LG, etaLG, Id, type_obj, type_mor, IdSM, IdLG;
    
    A := RightPresentations( R : FinalizeCategory := false );
    
    AddImageEmbedding( A, ImageEmbeddingForRightModules );
    
    Finalize( A );
    
    SM := FunctorStandardModuleRight( R );
    
    etaSM := NaturalIsomorphismFromIdentityToStandardModuleRight( R );
    
    LG := FunctorLessGeneratorsRight( R );
    
    etaLG := NaturalIsomorphismFromIdentityToLessGeneratorsRight( R );
    
    ## CategoryWithAmbientObject
    
    A := CategoryWithAmbientObject( A );
    
    Id := IdentityFunctor( A );
    
    SM := WithAmbientObject( SM, A );
    
    etaSM := WithAmbientObject( etaSM, Id, SM );
    
    LG := WithAmbientObject( LG, A );
    
    etaLG := WithAmbientObject( etaLG, Id, LG );
    
    type_obj :=
      NewType( TheFamilyOfIntrinsicObjects,
              IsCapCategoryIntrinsicObjectRep and
              IsFinitelyPresentedModuleRep and
              IsHomalgRightObjectOrMorphismOfRightObjects
              );
    
    type_mor :=
      NewType( TheFamilyOfIntrinsicMorphisms,
              IsCapCategoryIntrinsicMorphismRep and
              IsMapOfFinitelyGeneratedModulesRep and
              IsHomalgRightObjectOrMorphismOfRightObjects
              );
    
    ## IntrinsicCategory
    
    A := IntrinsicCategory( A, type_obj, type_mor );
    
    ## TODO: legacy
    SetFilterObj( A, IsHomalgCategory );
    A!.containers := rec( );
    
    Id := IdentityFunctor( A );
    
    SM := Intrinsify( SM, A );
    
    etaSM := Intrinsify( etaSM, Id, SM );
    
    LG := Intrinsify( LG, A );
    
    etaLG := Intrinsify( etaLG, Id, LG );
    
    ## TurnAutoequivalenceIntoIdentityFunctor
    
    IdSM := TurnAutoequivalenceIntoIdentityFunctor( etaSM );
    
    A!.IdSM := IdSM;
    
    IdLG := TurnAutoequivalenceIntoIdentityFunctor( etaLG );
    
    A!.IdLG := IdLG;
    
    return A;
    
end );