#!/bin/bash
#DATA_DIR="/data/tungtv/Code/dataset/dataset_addresa/data_transformed" && \  #path run server
DATA_DIR="/home/tungtv/Documents/Code/dataset/data_transformed" && \  #path run local
python3 -m acr.preprocessing.acr_preprocess_cafebiz \
	--input_articles_csv_path ${DATA_DIR}/content_news_demo_th2.csv \
 	--input_word_embeddings_path ${DATA_DIR}/74/model.txt \
 	--vocab_most_freq_words 100000 \
	--max_words_length 1000 \
 	--output_word_vocab_embeddings_path ${DATA_DIR}/pickles/acr_word_vocab_embeddings.pickle \
 	--output_label_encoders ${DATA_DIR}/pickles/acr_label_encoders.pickle \
 	--output_tf_records_path "${DATA_DIR}/articles_tfrecords/adressa_articles_*.tfrecord.gz" \
	--output_articles_csv_path "${DATA_DIR}/adressa_articles.csv" \
 	--articles_by_tfrecord 1000
