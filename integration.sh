RESULT=$(docker run -e NLTK_DATA=/var/task/nltk_data -e AWS_LAMBDA_FUNCTION_MEMORY_SIZE=128 \
 --rm -v "$PWD"/package:/var/task lambci/lambda:python3.7 lambda_function.lambda_handler)

if [[ $RESULT == *"title"* ]]; then
  exit 0
else
  exit 1
fi
