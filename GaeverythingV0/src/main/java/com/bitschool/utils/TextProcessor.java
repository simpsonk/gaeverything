package com.bitschool.utils;

import java.util.List;

import org.openkoreantext.processor.OpenKoreanTextProcessorJava;
import org.openkoreantext.processor.phrase_extractor.KoreanPhraseExtractor;
import org.openkoreantext.processor.phrase_extractor.KoreanPhraseExtractor.KoreanPhrase;
import org.openkoreantext.processor.tokenizer.KoreanTokenizer;

import scala.collection.Seq;

public class TextProcessor {

	public static void main(String[] args) {
		
		String text = "한국어 처리 테스트 하하ㅏ";
		CharSequence normalized = OpenKoreanTextProcessorJava.normalize(text);
		
		//tokenize
		Seq<KoreanTokenizer.KoreanToken> tokens = OpenKoreanTextProcessorJava.tokenize(normalized);
		System.out.println(OpenKoreanTextProcessorJava.tokensToJavaKoreanTokenList(tokens));
		System.out.println(OpenKoreanTextProcessorJava.tokensToJavaStringList(tokens));
		
		//phrase 
		List<KoreanPhraseExtractor.KoreanPhrase> phrases = OpenKoreanTextProcessorJava.extractPhrases(tokens, true, true);
		System.out.println(phrases);
		
		
		
	}
}
