# clean text -----------------------------
textc <- clean_text(text_sample,profanity)

# create gram tables ---------------------

unig <- create_gram_table2(textc,1)
big <- create_gram_table2(textc,2)
trig <- create_gram_table2(textc,3)


## GT discount
GT1 <- GT_discount(unig,r,5)
GT2 <- GT_discount(big,r,5)
GT3 <- GT_discount(trig,r,5)

## add updated freq
unig[,c("Updated_Freq"):=ifelse(r<=5,r*GT1$GT_discount[r],r)]
big[,c("Updated_Freq"):=ifelse(r<=5,r*GT2$GT_discount[r],r)]
trig[,c("Updated_Freq"):=ifelse(r<=5,r*GT3$GT_discount[r],r)]


# sep 1st and 2nd words
big <- big[, c("big_1", "big_2") := tstrsplit(ngram, " ")]
big <- select(big,big_1,big_2,Updated_Freq)
# setorder(setDT(big), big_1, -r)

# sep 1st-2nd and 3rd words
trig[,c("trig_1"):=tstrsplit(ngram," [a-z]+$")]
trig[,c("trig_2"):=stri_extract_last_words(ngram)]
trig <- select(trig,trig_1,trig_2,Updated_Freq)

# setorder(setDT(trig), trig_1, -Trigram_Freq)
