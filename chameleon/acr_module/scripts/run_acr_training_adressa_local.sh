#!/bin/bash

DATA_DIR="/data/tungtv/Code/dataset/dataset_addresa/data_transformed" && \
JOB_PREFIX=adressa && \
JOB_ID=`whoami`_${JOB_PREFIX}_`date '+%Y_%m_%d_%H%M%S'` && \
MODEL_DIR='/data/tungtv/Code/dataset/dataset_addresa/data_transformed/tmp/chameleon/addressa/jobs/'${JOB_ID} && \
echo 'Running training job and outputing to '${MODEL_DIR} && \
python3 -m acr.acr_trainer_adressa \
	--model_dir ${MODEL_DIR} \
	--train_set_path_regex "${DATA_DIR}/articles_tfrecords/adressa_articles_*.tfrecord.gz" \
	--input_word_vocab_embeddings_path ${DATA_DIR}/pickles/acr_word_vocab_embeddings.pickle \
	--input_label_encoders_path ${DATA_DIR}/pickles/acr_label_encoders.pickle \
	--output_acr_metadata_embeddings_path ${DATA_DIR}/pickles/acr_articles_metadata_embeddings.pickle \
	--batch_size 128 \
	--truncate_tokens_length 1000 \
	--training_epochs 30 \
	--learning_rate 3e-4 \
	--dropout_keep_prob 1.0 \
	--l2_reg_lambda 1e-5 \
	--text_feature_extractor "CNN" \
	--cnn_filter_sizes "3,4,5" \
	--cnn_num_filters 128 \
	--acr_embeddings_size 250
