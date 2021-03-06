module SimpleNLG
  %w(
    simplenlg.aggregation
    simplenlg.features
    simplenlg.format.english
    simplenlg.framework
    simplenlg.lexicon
    simplenlg.morphology.english
    simplenlg.orthography.english
    simplenlg.phrasespec
    simplenlg.realiser.english
    simplenlg.syntax.english
    simplenlg.xmlrealiser
    simplenlg.xmlrealiser.wrapper
  ).each { |package| include_package package }
end
