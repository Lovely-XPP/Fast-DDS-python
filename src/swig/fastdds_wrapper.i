%module fastdds_wrapper


// SWIG helper modules
%include "std_string.i"
%include "typemaps.i"
%include "std_shared_ptr.i"
%include "std_vector.i"

// Some operators are ignored, as there is no such thing in Python.
// Trying to export them issues a warning
%ignore *::operator=;
%ignore *::operator++;
%ignore *::operator!;

// Keywords that are not fully supported in SWIG
// and make not difference in python anyways
#define final

// Definition of internal types
typedef unsigned int uint32_t;

// Macro delcarations
// Any macro used on the Fast DDS header files will give an error if it is not redefined here
#define RTPS_DllAPI
#define FASTDDS_DEPRECATED_UNTIL(major, entity_name, msg)

// Forward class definition inside the namespaces
// SWIG generated code uses the interface definition as is, with no
// namespace prepending.
// Compilation will fail if we do not predeclare the classes here
// on the appropriate namespace
namespace eprosima {
namespace fastdds {
namespace dds {

class DataRepresentationQosPolicy;
class DataSharingQosPolicy;
class DeadlineQosPolicy;
class DestinationOrderQosPolicy;
class DisablePositiveACKsQosPolicy;
using DomainId_t = uint32_t;
class DomainParticipant;
class DomainParticipantFactory;
class DomainParticipantFactoryQos;
class DomainParticipantQos;
class DurabilityQosPolicy;
class DurabilityServiceQosPolicy;
class EntityFactoryQosPolicy;
class GroupDataQosPolicy;
class HistoryQosPolicy;
class InconsistentTopicStatus;
class InstanceHandle_t;
class InstanceStateKind;
class InstanceStateMask;
class LatencyBudgetQosPolicy;
class LifespanQosPolicy;
class LivelinessLostStatus;
class LivelinessQosPolicy;
class OfferedDeadlineMissedStatus;
class OfferedIncompatibleQosStatus;
class OwnershipQosPolicy;
class OwnershipStrengthQosPolicy;
class ParticipantResourceLimitsQos;
class PartitionQosPolicy;
class PresentationQosPolicy;
class PropertyPolicyQos;
class PublicationMatchedStatus;
class PublisherQos;
class PublishModeQosPolicy;
enum QosPolicyId_t;
class ReaderDataLifecycleQosPolicy;
class ReliabilityQosPolicy;
class RequestedDeadlineMissedStatus;
class RequestedIncompatibleQosStatus;
class ResourceLimitsQosPolicy;
class RTPSEndpointQos;
class SampleInfo;
class SampleLostStatus;
class SampleRejectedStatus;
class SampleStateKind;
class SampleStateMask;
class StatusCondition;
class StatusMask;
class SubscriberQos;
class SubscriptionMatchedStatus;
class TimeBasedFilterQosPolicy;
class TopicDataQosPolicy;
class TopicDataType;
class TopicDescription;
class TopicListener;
class TopicQos;
class TransportConfigQos;
class TransportPriorityQosPolicy;
class TypeConsistencyEnforcementQosPolicy;
class TypeIdV1;
class TypeObjectV1;
class TypeSupport;
class UserDataQosPolicy;
class WireProtocolConfigQos;
class WriterDataLifecycleQosPolicy;
class WriterQos;
class WriterResourceLimitsQos;
class xtypes;

namespace builtin {

class BuiltinTopicKey_t;

} //namespace builtin

} // namespace dds

namespace rtps {

class LocatorList;

} // namespace rtps

} // namespace fastdds

namespace fastrtps {
namespace rtps {

    class CDRMessage_t;

} // namespace rtps

namespace types {

//class ReturnCode_t;

}// namespace types

namespace xtypes {

class TypeInformation;

} // namespace xtypes
} // namespace fastrtps

} // namespace eprosima


// Definition of the API exported to the binding.
// The order of appearance in this list matters.
// For example, base classes **MUST** be included before its derived classes.
// Failing to do so will issue a warning, but will not stop the compilation.
// However, the resulting derived class will **not** be considered as inheriting from the base class

%include "fastdds/rtps/common/VendorId_t.i"
%include "fastdds/rtps/common/Types.i"
%include "fastrtps/types/TypesBase.i"
%include "fastdds/rtps/common/SerializedPayload.i"
%include "fastdds/rtps/common/CDRMessage_t.i"

/*
%include "fastdds/rtps/common/Property.i"
%include "fastdds/rtps/common/FragmentNumber.i"
%include "fastdds/rtps/common/LocatorSelector.i"
%include "fastdds/rtps/common/LocatorSelectorEntry.i"
%include "fastdds/rtps/common/CacheChange.i"
%include "fastdds/rtps/common/InstanceHandle.i"
%include "fastdds/rtps/common/Time_t.i"
%include "fastdds/rtps/common/LocatorListComparisons.i"
%include "fastdds/rtps/common/Token.i"
%include "fastdds/rtps/common/MatchingInfo.i"
%include "fastdds/rtps/common/LocatorList.i"
%include "fastdds/rtps/common/ChangeKind_t.i"
%include "fastdds/rtps/common/Guid.i"
%include "fastdds/rtps/common/LocatorsIterator.i"
%include "fastdds/rtps/common/all_common.i"
%include "fastdds/rtps/common/PortParameters.i"
%include "fastdds/rtps/common/EntityId_t.i"
%include "fastdds/rtps/common/SampleIdentity.i"
%include "fastdds/rtps/common/Locator.i"
%include "fastdds/rtps/common/SequenceNumber.i"
%include "fastdds/rtps/common/RemoteLocators.i"
%include "fastdds/rtps/common/WriteParams.i"
%include "fastdds/rtps/common/GuidPrefix_t.i"
%include "fastdds/rtps/common/BinaryProperty.i"

%include "fastrtps/rtps/common/Property.i"
%include "fastrtps/rtps/common/SerializedPayload.i"
%include "fastrtps/rtps/common/FragmentNumber.i"
%include "fastrtps/rtps/common/LocatorSelector.i"
%include "fastrtps/rtps/common/LocatorSelectorEntry.i"
%include "fastrtps/rtps/common/CacheChange.i"
%include "fastrtps/rtps/common/InstanceHandle.i"
%include "fastrtps/rtps/common/Time_t.i"
%include "fastrtps/rtps/common/LocatorListComparisons.i"
%include "fastrtps/rtps/common/CDRMessage_t.i"
%include "fastrtps/rtps/common/Token.i"
%include "fastrtps/rtps/common/MatchingInfo.i"
%include "fastrtps/rtps/common/Guid.i"
%include "fastrtps/rtps/common/all_common.i"
%include "fastrtps/rtps/common/PortParameters.i"
%include "fastrtps/rtps/common/SampleIdentity.i"
%include "fastrtps/rtps/common/Locator.i"
%include "fastrtps/rtps/common/SequenceNumber.i"
%include "fastrtps/rtps/common/RemoteLocators.i"
%include "fastrtps/rtps/common/WriteParams.i"
%include "fastrtps/rtps/common/BinaryProperty.i"
%include "fastrtps/rtps/common/Types.i"



%include "fastdds/statistics/IListeners.i"
%include "fastdds/statistics/topic_names.i"
%include "fastdds/statistics/rtps/StatisticsCommon.i"
%include "fastdds/statistics/dds/publisher/qos/DataWriterQos.i"
%include "fastdds/statistics/dds/domain/DomainParticipant.i"
%include "fastdds/statistics/dds/subscriber/qos/DataReaderQos.i"
%include "fastdds/rtps/builtin/discovery/endpoint/EDP.i"
%include "fastdds/rtps/builtin/discovery/endpoint/EDPStatic.i"
%include "fastdds/rtps/builtin/discovery/endpoint/EDPSimple.i"
%include "fastdds/rtps/builtin/discovery/participant/PDP.i"
%include "fastdds/rtps/builtin/discovery/participant/PDPListener.i"
%include "fastdds/rtps/builtin/discovery/participant/PDPSimple.i"
%include "fastdds/rtps/builtin/data/ReaderProxyData.i"
%include "fastdds/rtps/builtin/data/ParticipantProxyData.i"
%include "fastdds/rtps/builtin/data/WriterProxyData.i"
%include "fastdds/rtps/builtin/liveliness/WLP.i"
%include "fastdds/rtps/builtin/liveliness/WLPListener.i"
%include "fastdds/rtps/builtin/BuiltinProtocols.i"
%include "fastdds/rtps/rtps_all.i"
%include "fastdds/rtps/attributes/HistoryAttributes.i"
%include "fastdds/rtps/attributes/EndpointAttributes.i"
%include "fastdds/rtps/attributes/ReaderAttributes.i"
%include "fastdds/rtps/attributes/RTPSParticipantAttributes.i"
%include "fastdds/rtps/attributes/RTPSParticipantAllocationAttributes.i"
%include "fastdds/rtps/attributes/WriterAttributes.i"
%include "fastdds/rtps/attributes/ServerAttributes.i"
%include "fastdds/rtps/attributes/PropertyPolicy.i"
%include "fastdds/rtps/reader/ReaderDiscoveryInfo.i"
%include "fastdds/rtps/reader/StatelessReader.i"
%include "fastdds/rtps/reader/StatefulReader.i"
%include "fastdds/rtps/reader/ReaderListener.i"
%include "fastdds/rtps/reader/StatefulPersistentReader.i"
%include "fastdds/rtps/reader/RTPSReader.i"
%include "fastdds/rtps/reader/StatelessPersistentReader.i"
%include "fastdds/rtps/Endpoint.i"
%include "fastdds/rtps/history/ReaderHistory.i"
%include "fastdds/rtps/history/WriterHistory.i"
%include "fastdds/rtps/history/IPayloadPool.i"
%include "fastdds/rtps/history/History.i"
%include "fastdds/rtps/history/IChangePool.i"
%include "fastdds/rtps/transport/TCPTransportDescriptor.i"
%include "fastdds/rtps/transport/test_UDPv4TransportDescriptor.i"
%include "fastdds/rtps/transport/UDPv4TransportDescriptor.i"
%include "fastdds/rtps/transport/UDPTransportDescriptor.i"
%include "fastdds/rtps/transport/UDPv6TransportDescriptor.i"
%include "fastdds/rtps/transport/TransportInterface.i"
%include "fastdds/rtps/transport/TCPv4TransportDescriptor.i"
%include "fastdds/rtps/transport/SocketTransportDescriptor.i"
%include "fastdds/rtps/transport/shared_mem/SharedMemTransportDescriptor.i"
%include "fastdds/rtps/transport/TransportReceiverInterface.i"
%include "fastdds/rtps/transport/TransportDescriptorInterface.i"
%include "fastdds/rtps/transport/TCPv6TransportDescriptor.i"
%include "fastdds/rtps/exceptions/Exception.i"
%include "fastdds/rtps/RTPSDomain.i"
%include "fastdds/rtps/messages/RTPSMessageSenderInterface.i"
%include "fastdds/rtps/messages/MessageReceiver.i"
%include "fastdds/rtps/messages/RTPSMessageCreator.i"
%include "fastdds/rtps/messages/RTPSMessageGroup.i"
%include "fastdds/rtps/messages/CDRMessage.i"
%include "fastdds/rtps/messages/RTPS_messages.i"
%include "fastdds/rtps/messages/CDRMessage.i"
%include "fastdds/rtps/security/common/SharedSecretHandle.i"
%include "fastdds/rtps/security/common/ParticipantGenericMessage.i"
%include "fastdds/rtps/security/common/Handle.i"
%include "fastdds/rtps/security/accesscontrol/AccessControl.i"
%include "fastdds/rtps/security/accesscontrol/ParticipantSecurityAttributes.i"
%include "fastdds/rtps/security/accesscontrol/SecurityMaskUtilities.i"
%include "fastdds/rtps/security/accesscontrol/EndpointSecurityAttributes.i"
%include "fastdds/rtps/security/logging/LoggingLevel.i"
%include "fastdds/rtps/security/logging/LogOptions.i"
%include "fastdds/rtps/security/logging/BuiltinLoggingType.i"
%include "fastdds/rtps/security/logging/Logging.i"
%include "fastdds/rtps/security/logging/NameValuePair.i"
%include "fastdds/rtps/security/exceptions/SecurityException.i"
%include "fastdds/rtps/security/authentication/Handshake.i"
%include "fastdds/rtps/security/authentication/Authentication.i"
%include "fastdds/rtps/security/cryptography/CryptoTypes.i"
%include "fastdds/rtps/security/cryptography/CryptoKeyExchange.i"
%include "fastdds/rtps/security/cryptography/Cryptography.i"
%include "fastdds/rtps/security/cryptography/CryptoTransform.i"
%include "fastdds/rtps/security/cryptography/CryptoKeyFactory.i"
%include "fastdds/rtps/participant/ParticipantDiscoveryInfo.i"
%include "fastdds/rtps/participant/RTPSParticipantListener.i"
%include "fastdds/rtps/participant/RTPSParticipant.i"
%include "fastdds/rtps/network/NetworkFactory.i"
%include "fastdds/rtps/network/SenderResource.i"
%include "fastdds/rtps/network/ReceiverResource.i"
%include "fastdds/rtps/writer/StatelessWriter.i"
%include "fastdds/rtps/writer/LivelinessManager.i"
%include "fastdds/rtps/writer/LivelinessData.i"
%include "fastdds/rtps/writer/DeliveryRetCode.i"
%include "fastdds/rtps/writer/ChangeForReader.i"
%include "fastdds/rtps/writer/StatefulPersistentWriter.i"
%include "fastdds/rtps/writer/ReaderLocator.i"
%include "fastdds/rtps/writer/PersistentWriter.i"
%include "fastdds/rtps/writer/WriterListener.i"
%include "fastdds/rtps/writer/StatefulWriter.i"
%include "fastdds/rtps/writer/IReaderDataFilter.i"
%include "fastdds/rtps/writer/LocatorSelectorSender.i"
%include "fastdds/rtps/writer/ReaderProxy.i"
%include "fastdds/rtps/writer/WriterDiscoveryInfo.i"
%include "fastdds/rtps/writer/StatelessPersistentWriter.i"
%include "fastdds/rtps/writer/RTPSWriter.i"
%include "fastdds/rtps/flowcontrol/FlowControllerSchedulerPolicy.i"
%include "fastdds/rtps/flowcontrol/ThroughputControllerDescriptor.i"
%include "fastdds/rtps/flowcontrol/FlowControllerConsts.i"
%include "fastdds/rtps/flowcontrol/FlowControllerDescriptor.i"
%include "fastdds/rtps/resources/ResourceEvent.i"
%include "fastdds/rtps/resources/ResourceManagement.i"
%include "fastdds/rtps/resources/TimedEvent.i"
%include "fastdds/rtps/rtps_fwd.i"
%include "fastrtps/publisher/PublisherListener.i"
%include "fastrtps/publisher/PublisherHistory.i"
%include "fastrtps/publisher/Publisher.i"
%include "fastrtps/common/KeyedChanges.i"
%include "fastrtps/attributes/PublisherAttributes.i"
%include "fastrtps/attributes/LibrarySettingsAttributes.i"
%include "fastrtps/attributes/ParticipantAttributes.i"
%include "fastrtps/attributes/ReplierAttributes.i"
%include "fastrtps/attributes/TopicAttributes.i"
%include "fastrtps/attributes/all_attributes.i"
%include "fastrtps/attributes/SubscriberAttributes.i"
%include "fastrtps/attributes/RequesterAttributes.i"
%include "fastrtps/qos/WriterQos.i"
%include "fastrtps/qos/ReaderQos.i"
%include "fastrtps/qos/DeadlineMissedStatus.i"
%include "fastrtps/qos/QosPolicies.i"
%include "fastrtps/qos/IncompatibleQosStatus.i"
%include "fastrtps/qos/LivelinessLostStatus.i"
%include "fastrtps/qos/LivelinessChangedStatus.i"
%include "fastrtps/qos/ParameterTypes.i"
%include "fastrtps/qos/SampleRejectedStatus.i"
%include "fastrtps/utils/Semaphore.i"
%include "fastrtps/utils/System.i"
%include "fastrtps/utils/fixed_size_string.i"
%include "fastrtps/utils/TimedMutex.i"
%include "fastrtps/utils/collections/ResourceLimitedContainerConfig.i"
%include "fastrtps/utils/collections/ResourceLimitedVector.i"
%include "fastrtps/utils/collections/foonathan_memory_helpers.i"
%include "fastrtps/utils/StringMatching.i"
%include "fastrtps/utils/string_convert.i"
%include "fastrtps/utils/IPFinder.i"
%include "fastrtps/utils/IPLocator.i"
%include "fastrtps/utils/TimedConditionVariable.i"
%include "fastrtps/utils/fixed_size_bitmap.i"
%include "fastrtps/utils/TimeConversion.i"
%include "fastrtps/utils/md5.i"
%include "fastrtps/utils/DBQueue.i"
%include "fastrtps/types/DynamicDataFactory.i"
%include "fastrtps/types/DynamicType.i"
%include "fastrtps/types/TypeNamesGenerator.i"
%include "fastrtps/types/AnnotationDescriptor.i"
%include "fastrtps/types/TypeDescriptor.i"
%include "fastrtps/types/DynamicDataPtr.i"
%include "fastrtps/types/DynamicTypeBuilder.i"
%include "fastrtps/types/DynamicTypeBuilderFactory.i"
%include "fastrtps/types/TypeObjectHashId.i"
%include "fastrtps/types/TypeObject.i"
%include "fastrtps/types/BuiltinAnnotationsTypeObject.i"
%include "fastrtps/types/DynamicDataHelper.i"
%include "fastrtps/types/DynamicTypeBuilderPtr.i"
%include "fastrtps/types/TypeIdentifier.i"
%include "fastrtps/types/DynamicData.i"
%include "fastrtps/types/MemberDescriptor.i"
%include "fastrtps/types/TypeIdentifierTypes.i"
%include "fastrtps/types/DynamicTypeMember.i"
%include "fastrtps/types/AnnotationParameterValue.i"
%include "fastrtps/types/TypeObjectFactory.i"
%include "fastrtps/types/DynamicTypePtr.i"
%include "fastrtps/types/DynamicPubSubType.i"
%include "fastrtps/config/doxygen_modules.i"
%include "fastrtps/log/Log.i"
%include "fastrtps/log/StdoutConsumer.i"
%include "fastrtps/log/FileConsumer.i"
%include "fastrtps/log/Colors.i"
%include "fastrtps/transport/TCPTransportDescriptor.i"
%include "fastrtps/transport/test_UDPv4TransportDescriptor.i"
%include "fastrtps/transport/UDPv4TransportDescriptor.i"
%include "fastrtps/transport/UDPTransportDescriptor.i"
%include "fastrtps/transport/UDPv6TransportDescriptor.i"
%include "fastrtps/transport/TransportInterface.i"
%include "fastrtps/transport/TCPv4TransportDescriptor.i"
%include "fastrtps/transport/SocketTransportDescriptor.i"
%include "fastrtps/transport/TransportReceiverInterface.i"
%include "fastrtps/transport/TransportDescriptorInterface.i"
%include "fastrtps/transport/TCPv6TransportDescriptor.i"
%include "fastrtps/subscriber/SubscriberHistory.i"
%include "fastrtps/subscriber/SubscriberListener.i"
%include "fastrtps/subscriber/SampleInfo.i"
%include "fastrtps/subscriber/Subscriber.i"
%include "fastrtps/participant/ParticipantListener.i"
%include "fastrtps/participant/Participant.i"
%include "fastrtps/rtps/builtin/discovery/endpoint/EDP.i"
%include "fastrtps/rtps/builtin/discovery/endpoint/EDPStatic.i"
%include "fastrtps/rtps/builtin/discovery/endpoint/EDPSimple.i"
%include "fastrtps/rtps/builtin/discovery/participant/PDP.i"
%include "fastrtps/rtps/builtin/discovery/participant/PDPListener.i"
%include "fastrtps/rtps/builtin/discovery/participant/PDPSimple.i"
%include "fastrtps/rtps/builtin/data/ReaderProxyData.i"
%include "fastrtps/rtps/builtin/data/ParticipantProxyData.i"
%include "fastrtps/rtps/builtin/data/WriterProxyData.i"
%include "fastrtps/rtps/builtin/liveliness/WLP.i"
%include "fastrtps/rtps/builtin/liveliness/WLPListener.i"
%include "fastrtps/rtps/builtin/BuiltinProtocols.i"
%include "fastrtps/rtps/rtps_all.i"
%include "fastrtps/rtps/attributes/HistoryAttributes.i"
%include "fastrtps/rtps/attributes/EndpointAttributes.i"
%include "fastrtps/rtps/attributes/ReaderAttributes.i"
%include "fastrtps/rtps/attributes/RTPSParticipantAttributes.i"
%include "fastrtps/rtps/attributes/RTPSParticipantAllocationAttributes.i"
%include "fastrtps/rtps/attributes/WriterAttributes.i"
%include "fastrtps/rtps/attributes/ServerAttributes.i"
%include "fastrtps/rtps/attributes/PropertyPolicy.i"
%include "fastrtps/rtps/reader/ReaderDiscoveryInfo.i"
%include "fastrtps/rtps/reader/StatelessReader.i"
%include "fastrtps/rtps/reader/StatefulReader.i"
%include "fastrtps/rtps/reader/ReaderListener.i"
%include "fastrtps/rtps/reader/StatefulPersistentReader.i"
%include "fastrtps/rtps/reader/RTPSReader.i"
%include "fastrtps/rtps/reader/StatelessPersistentReader.i"
%include "fastrtps/rtps/Endpoint.i"
%include "fastrtps/rtps/history/ReaderHistory.i"
%include "fastrtps/rtps/history/WriterHistory.i"
%include "fastrtps/rtps/history/History.i"
%include "fastrtps/rtps/exceptions/Exception.i"
%include "fastrtps/rtps/RTPSDomain.i"
%include "fastrtps/rtps/messages/RTPSMessageSenderInterface.i"
%include "fastrtps/rtps/messages/MessageReceiver.i"
%include "fastrtps/rtps/messages/RTPSMessageCreator.i"
%include "fastrtps/rtps/messages/RTPSMessageGroup.i"
%include "fastrtps/rtps/messages/RTPS_messages.i"
%include "fastrtps/rtps/messages/CDRMessage.i"
%include "fastrtps/rtps/security/common/SharedSecretHandle.i"
%include "fastrtps/rtps/security/common/ParticipantGenericMessage.i"
%include "fastrtps/rtps/security/common/Handle.i"
%include "fastrtps/rtps/security/accesscontrol/AccessControl.i"
%include "fastrtps/rtps/security/accesscontrol/ParticipantSecurityAttributes.i"
%include "fastrtps/rtps/security/accesscontrol/SecurityMaskUtilities.i"
%include "fastrtps/rtps/security/accesscontrol/EndpointSecurityAttributes.i"
%include "fastrtps/rtps/security/exceptions/SecurityException.i"
%include "fastrtps/rtps/security/authentication/Handshake.i"
%include "fastrtps/rtps/security/authentication/Authentication.i"
%include "fastrtps/rtps/security/cryptography/CryptoTypes.i"
%include "fastrtps/rtps/security/cryptography/CryptoKeyExchange.i"
%include "fastrtps/rtps/security/cryptography/Cryptography.i"
%include "fastrtps/rtps/security/cryptography/CryptoTransform.i"
%include "fastrtps/rtps/security/cryptography/CryptoKeyFactory.i"
%include "fastrtps/rtps/participant/ParticipantDiscoveryInfo.i"
%include "fastrtps/rtps/participant/RTPSParticipantListener.i"
%include "fastrtps/rtps/participant/RTPSParticipant.i"
%include "fastrtps/rtps/network/NetworkFactory.i"
%include "fastrtps/rtps/network/SenderResource.i"
%include "fastrtps/rtps/network/ReceiverResource.i"
%include "fastrtps/rtps/writer/StatelessWriter.i"
%include "fastrtps/rtps/writer/LivelinessManager.i"
%include "fastrtps/rtps/writer/LivelinessData.i"
%include "fastrtps/rtps/writer/StatefulPersistentWriter.i"
%include "fastrtps/rtps/writer/ReaderLocator.i"
%include "fastrtps/rtps/writer/PersistentWriter.i"
%include "fastrtps/rtps/writer/WriterListener.i"
%include "fastrtps/rtps/writer/StatefulWriter.i"
%include "fastrtps/rtps/writer/ReaderProxy.i"
%include "fastrtps/rtps/writer/WriterDiscoveryInfo.i"
%include "fastrtps/rtps/writer/StatelessPersistentWriter.i"
%include "fastrtps/rtps/writer/RTPSWriter.i"
%include "fastrtps/rtps/flowcontrol/ThroughputControllerDescriptor.i"
%include "fastrtps/rtps/resources/ResourceEvent.i"
%include "fastrtps/rtps/resources/ResourceManagement.i"
%include "fastrtps/rtps/resources/TimedEvent.i"
%include "fastrtps/rtps/rtps_fwd.i"
%include "fastrtps/xmlparser/XMLParserCommon.i"
%include "fastrtps/xmlparser/XMLParser.i"
%include "fastrtps/xmlparser/XMLTree.i"
%include "fastrtps/xmlparser/XMLEndpointParser.i"
%include "fastrtps/xmlparser/XMLProfileManager.i"
%include "fastrtps/Domain.i"
*/

%include "fastdds/dds/core/Entity.i"
%include "fastdds/dds/core/condition/Condition.i"
%include "fastdds/dds/core/condition/StatusCondition.i"
%include "fastdds/dds/core/condition/GuardCondition.i"
%include "fastdds/dds/core/condition/WaitSet.i"
%include "fastdds/dds/core/LoanableTypedCollection.i"
%include "fastdds/dds/core/StackAllocatedSequence.i"
%include "fastdds/dds/core/LoanableCollection.i"
%include "fastdds/dds/core/UserAllocatedSequence.i"
%include "fastdds/dds/core/LoanableSequence.i"
%include "fastdds/dds/core/LoanableArray.i"
%include "fastdds/dds/core/policy/ParameterTypes.i"
//%include "fastdds/dds/core/policy/QosPolicies.i"
//%include "fastdds/dds/core/policy/ReaderDataLifecycleQosPolicy.i"
//%include "fastdds/dds/core/policy/WriterDataLifecycleQosPolicy.i"
%include "fastdds/dds/core/status/LivelinessChangedStatus.i"
// This give problems with undefined std::bitset -> need a wrapper for the STL
//%include "fastdds/dds/core/status/StatusMask.i"
%include "fastdds/dds/core/status/MatchedStatus.i"
%include "fastdds/dds/core/status/SubscriptionMatchedStatus.i"
%include "fastdds/dds/core/status/BaseStatus.i"
%include "fastdds/dds/core/status/IncompatibleQosStatus.i"
%include "fastdds/dds/core/status/DeadlineMissedStatus.i"
%include "fastdds/dds/core/status/SampleRejectedStatus.i"
%include "fastdds/dds/core/status/PublicationMatchedStatus.i"
%include "fastdds/dds/topic/TopicDataType.i"
%include "fastdds/dds/topic/qos/TopicQos.i"
%include "fastdds/dds/topic/TypeSupport.i"
%include "fastdds/dds/topic/TopicDescription.i"
%include "fastdds/dds/topic/Topic.i"
%include "fastdds/dds/topic/TopicListener.i"
%include "fastdds/dds/builtin/common/Types.i"
%include "fastdds/dds/builtin/common/ReplyHeader.i"
%include "fastdds/dds/builtin/common/RequestHeader.i"
%include "fastdds/dds/subscriber/qos/ReaderQos.i"
%include "fastdds/dds/subscriber/qos/DataReaderQos.i"
%include "fastdds/dds/subscriber/qos/SubscriberQos.i"
%include "fastdds/dds/subscriber/DataReaderListener.i"
%include "fastdds/dds/subscriber/SubscriberListener.i"
%include "fastdds/dds/subscriber/ViewState.i"
%include "fastdds/dds/subscriber/DataReader.i"
%include "fastdds/dds/subscriber/SampleInfo.i"
%include "fastdds/dds/subscriber/SampleState.i"
%include "fastdds/dds/subscriber/Subscriber.i"
%include "fastdds/dds/subscriber/InstanceState.i"
%include "fastdds/dds/publisher/qos/PublisherQos.i"
%include "fastdds/dds/publisher/qos/DataWriterQos.i"
%include "fastdds/dds/publisher/qos/WriterQos.i"
%include "fastdds/dds/publisher/DataWriter.i"
%include "fastdds/dds/publisher/DataWriterListener.i"
%include "fastdds/dds/publisher/PublisherListener.i"
%include "fastdds/dds/publisher/Publisher.i"
%include "fastdds/dds/builtin/typelookup/common/TypeLookupTypes.i"
%include "fastdds/dds/builtin/typelookup/TypeLookupRequestListener.i"
%include "fastdds/dds/builtin/typelookup/TypeLookupReplyListener.i"
%include "fastdds/dds/builtin/typelookup/TypeLookupManager.i"
%include "fastdds/dds/builtin/topic/PublicationBuiltinTopicData.i"
%include "fastdds/dds/builtin/topic/BuiltinTopicKey.i"
%include "fastdds/dds/builtin/topic/TopicBuiltinTopicData.i"
%include "fastdds/dds/builtin/topic/ParticipantBuiltinTopicData.i"
%include "fastdds/dds/builtin/topic/SubscriptionBuiltinTopicData.i"
%include "fastdds/dds/domain/DomainParticipantListener.i"
%include "fastdds/dds/domain/qos/DomainParticipantFactoryQos.i"
%include "fastdds/dds/domain/qos/DomainParticipantQos.i"
%include "fastdds/dds/domain/DomainParticipant.i"
%include "fastdds/dds/domain/DomainParticipantFactory.i"

// Log functionality not available in the bind 
// Logs in the library is still available, only 'Log' class will not be available on Python
/*
%include "fastdds/dds/log/Log.i"
%include "fastdds/dds/log/OStreamConsumer.i"
%include "fastdds/dds/log/FileConsumer.i"
%include "fastdds/dds/log/StdoutErrConsumer.i"
%include "fastdds/dds/log/StdoutConsumer.i"
%include "fastdds/dds/log/Colors.i"
*/


