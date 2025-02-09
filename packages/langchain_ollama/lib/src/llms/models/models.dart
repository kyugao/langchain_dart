import 'package:langchain/langchain.dart';

/// {@template ollama_options}
/// Options to pass into the Ollama LLM.
/// {@endtemplate}
class OllamaOptions extends LLMOptions {
  /// {@macro ollama_options}
  const OllamaOptions({
    this.model = 'llama2',
    this.system,
    this.template,
    this.context,
    this.format,
    this.raw,
    this.numKeep,
    this.seed,
    this.numPredict,
    this.topK,
    this.topP,
    this.tfsZ,
    this.typicalP,
    this.repeatLastN,
    this.temperature,
    this.repeatPenalty,
    this.presencePenalty,
    this.frequencyPenalty,
    this.mirostat,
    this.mirostatTau,
    this.mirostatEta,
    this.penalizeNewline,
    this.stop,
    this.numa,
    this.numCtx,
    this.numBatch,
    this.numGqa,
    this.numGpu,
    this.mainGpu,
    this.lowVram,
    this.f16KV,
    this.logitsAll,
    this.vocabOnly,
    this.useMmap,
    this.useMlock,
    this.embeddingOnly,
    this.ropeFrequencyBase,
    this.ropeFrequencyScale,
    this.numThread,
  });

  /// The model used to generate completions
  final String model;

  /// The system prompt (Overrides what is defined in the Modelfile).
  final String? system;

  /// The full prompt or prompt template (overrides what is defined in the
  /// Modelfile).
  final String? template;

  /// The context parameter returned from a previous request to
  /// [generateCompletion], this can be used to keep a short conversational
  /// memory.
  final List<int>? context;

  /// The format to return a response in. Currently the only accepted value is
  /// json.
  ///
  /// Enable JSON mode by setting the format parameter to json. This will
  /// structure the response as valid JSON.
  ///
  /// Note: it's important to instruct the model to use JSON in the prompt.
  /// Otherwise, the model may generate large amounts whitespace.
  final OllamaResponseFormat? format;

  /// If `true` no formatting will be applied to the prompt and no context will
  /// be returned.
  ///
  /// You may choose to use the `raw` parameter if you are specifying a full
  /// templated prompt in your request to the API, and are managing history
  /// yourself.
  final bool? raw;

  /// Number of tokens to keep from the prompt.
  /// (Default: 0)
  final int? numKeep;

  /// Sets the random number seed to use for generation. Setting this to a
  /// specific number will make the model generate the same text for the same
  /// prompt.
  /// (Default: 0)
  final int? seed;

  /// Maximum number of tokens to predict when generating text.
  /// (Default: 128, -1 = infinite generation, -2 = fill context)
  final int? numPredict;

  /// Reduces the probability of generating nonsense. A higher value (e.g. 100)
  /// will give more diverse answers, while a lower value (e.g. 10) will be
  /// more conservative.
  /// (Default: 40)
  final int? topK;

  /// Works together with top-k. A higher value (e.g., 0.95) will lead to more
  /// diverse text, while a lower value (e.g., 0.5) will generate more focused
  /// and conservative text.
  /// (Default: 0.9)
  final double? topP;

  /// Tail free sampling is used to reduce the impact of less probable tokens
  /// from the output. A higher value (e.g., 2.0) will reduce the impact more,
  /// while a value of 1.0 disables this setting.
  /// (default: 1)
  final double? tfsZ;

  /// Typical p is used to reduce the impact of less probable tokens from the
  /// output.
  /// (Default: 1.0)
  final double? typicalP;

  /// Sets how far back for the model to look back to prevent repetition.
  /// (Default: 64, 0 = disabled, -1 = num_ctx)
  final int? repeatLastN;

  /// The temperature of the model. Increasing the temperature will make the
  /// model answer more creatively.
  /// (Default: 0.8)
  final double? temperature;

  /// Sets how strongly to penalize repetitions. A higher value (e.g., 1.5)
  /// will penalize repetitions more strongly, while a lower value (e.g., 0.9)
  /// will be more lenient.
  /// (Default: 1.1)
  final double? repeatPenalty;

  /// Positive values penalize new tokens based on whether they appear in the
  /// text so far, increasing the model's likelihood to talk about new topics.
  final double? presencePenalty;

  /// Positive values penalize new tokens based on their existing frequency in
  /// the text so far, decreasing the model's likelihood to repeat the same
  /// line verbatim.
  final double? frequencyPenalty;

  /// Enable Mirostat sampling for controlling perplexity.
  /// (default: 0, 0 = disabled, 1 = Mirostat, 2 = Mirostat 2.0)
  final int? mirostat;

  /// Controls the balance between coherence and diversity of the output. A
  /// lower value will result in more focused and coherent text.
  /// (Default: 5.0)
  final double? mirostatTau;

  /// Influences how quickly the algorithm responds to feedback from the
  /// generated text. A lower learning rate will result in slower adjustments,
  /// while a higher learning rate will make the algorithm more responsive.
  /// (Default: 0.1)
  final double? mirostatEta;

  /// Penalize newlines in the output.
  /// (Default: false)
  final bool? penalizeNewline;

  /// Sequences where the API will stop generating further tokens. The returned
  /// text will not contain the stop sequence.
  final List<String>? stop;

  /// Enable NUMA support.
  /// (Default: false)
  final bool? numa;

  /// Sets the size of the context window used to generate the next token.
  final int? numCtx;

  /// Sets the number of batches to use for generation.
  /// (Default: 1)
  final int? numBatch;

  /// The number of GQA groups in the transformer layer. Required for some
  /// models, for example it is 8 for `llama2:70b`.
  final int? numGqa;

  /// The number of layers to send to the GPU(s). On macOS it defaults to 1 to
  /// enable metal support, 0 to disable.
  final int? numGpu;

  /// The GPU to use for the main model.
  /// (Default: 0)
  final int? mainGpu;

  /// Enable low VRAM mode.
  /// (Default: false)
  final bool? lowVram;

  /// Enable f16 key/value.
  /// (Default: false)
  final bool? f16KV;

  /// Enable logits all.
  /// (Default: false)
  final bool? logitsAll;

  /// Enable vocab only.
  /// (Default: false)
  final bool? vocabOnly;

  /// Enable mmap.
  /// (Default: false)
  final bool? useMmap;

  /// Enable mlock.
  /// (Default: false)
  final bool? useMlock;

  /// Enable embedding only.
  /// (Default: false)
  final bool? embeddingOnly;

  /// The base of the rope frequency scale.
  /// (Default: 1.0)
  final double? ropeFrequencyBase;

  /// The scale of the rope frequency.
  /// (Default: 1.0)
  final double? ropeFrequencyScale;

  /// Sets the number of threads to use during computation. By default, Ollama
  /// will detect this for optimal performance. It is recommended to set this
  /// value to the number of physical CPU cores your system has (as opposed to
  /// the logical number of cores).
  final int? numThread;
}

/// The format to return a response in.
///
/// Currently the only accepted value is json.
enum OllamaResponseFormat {
  /// Enable JSON mode by setting the format parameter to json. This will
  /// structure the response as valid JSON.
  ///
  /// Note: it's important to instruct the model to use JSON in the prompt.
  /// Otherwise, the model may generate large amounts whitespace.
  json,
}
