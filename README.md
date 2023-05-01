# AKS
# Reference repository - https://github.com/Azure/terraform-azurerm-aks
https://github.com/Azure/terraform-azurerm-aks/blob/main/main.tf
test-cluster-gc6gbvyr.ecd56352-dd4a-4cc1-a615-30bcf218a249.privatelink.eastus.azmk8s.io

VM_SIZES: https://learn.microsoft.com/en-us/azure/virtual-machines/sizes-b-series-burstable
Authebtication: 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

------------
Arguments Reference:

## automatic_channel_upgrade:
 - (Optional) The upgrade channel for this Kubernetes Cluster. Possible values are patch, rapid, node-image and stable. Omitting this field sets this value to none.
 Reference: https://learn.microsoft.com/en-in/azure/aks/auto-upgrade-cluster
 The following upgrade channels are available:
    Channel	Action	Example
    none: 
        - disables auto-upgrades and keeps the cluster at its current version of Kubernetes	
        - Default setting if left unchanged
    patch   
        - automatically upgrade the cluster to the latest supported patch version when it becomes available while keeping    the minor version the same.	
            - For example, if a cluster is running version 1.17.7 and versions 1.17.9, 1.18.4, 1.18.6, and 1.19.1 are available, your cluster is upgraded to 1.17.9
    stable:
        - automatically upgrade the cluster to the latest supported patch release on minor version N-1, where N is the        latest supported minor version.	For example, if a cluster is running version 1.17.7 and versions 1.17.9, 1.18.4, 1.18.6, and 1.19.1 are available, your cluster is upgraded to 1.18.6.
    rapid:	
        - automatically upgrade the cluster to the latest supported patch release on the latest supported minor version.	In cases where the cluster is at a version of Kubernetes that is at an N-2 minor version where N is the latest supported minor version, the cluster first upgrades to the latest supported patch version on N-1 minor version. 
        - For example, if a cluster is running version 1.17.7 and versions 1.17.9, 1.18.4, 1.18.6, and 1.19.1 are available, your cluster first is upgraded to 1.18.6, then is upgraded to 1.19.1.
    node-image:
    	- automatically upgrade the node image to the latest version available.	Microsoft provides patches and new images for image nodes frequently (usually weekly), but your running nodes won't get the new images unless you do a node image upgrade. Turning on the node-image channel will automatically update your node images whenever a new version is available. If you use this channel, Linux [unattended upgrades] will be disabled by default.

## local_account_disabled:
Reference: https://learn.microsoft.com/en-in/azure/aks/managed-aad#disable-local-accounts 

When you deploy an AKS cluster, local accounts are enabled by default. Even when enabling RBAC or Azure AD integration, --admin access still exists as a non-auditable backdoor option. You can disable local accounts using the parameter disable-local-accounts. The properties.disableLocalAccounts field has been added to the managed cluster API to indicate whether the feature is enabled or not on the cluster.
 Note
On clusters with Azure AD integration enabled, users assigned to an Azure AD administrators group specified by aad-admin-group-object-ids can still gain access using non-administrator credentials. On clusters without Azure AD integration enabled and properties.disableLocalAccounts set to true, any attempt to authenticate with user or admin credentials will fail.
After disabling local user accounts on an existing AKS cluster where users might have authenticated with local accounts, the administrator must rotate the cluster certificates to revoke certificates they might have had access to. If this is a new cluster, no action is required.
## oidc_issuer_enabled:
Reference: https://learn.microsoft.com/en-gb/azure/aks/use-oidc-issuer
## open_service_mesh_enabled:
Reference: https://learn.microsoft.com/en-in/azure/aks/open-service-mesh-about 
## private_cluster_public_fqdn_enabled:

private_cluster_public_fqdn_enabled is a setting that controls whether a Kubernetes cluster running in a private network is also accessible via a publicly resolvable Fully Qualified Domain Name (FQDN).

When set to true, the Kubernetes API server endpoint can be accessed both from within the private network and from the public internet using a publicly resolvable FQDN. This can be useful in scenarios where certain resources or services in the cluster need to be accessed from outside the private network, such as for testing, development, or exposing APIs to the public.

However, enabling this setting can also introduce security risks if not properly configured, as it allows potential attackers to discover the Kubernetes API server endpoint and potentially exploit vulnerabilities. It's important to properly secure and configure access control for the cluster to mitigate these risks.

## private_dns_zone_id:

private_dns_zone_id is an identifier for a private DNS zone in Amazon Web Services (AWS).

A private DNS zone is a container for DNS records that are used to route traffic within an AWS Virtual Private Cloud (VPC). By default, AWS automatically creates a private DNS zone for each VPC, and assigns a unique identifier to it.

The private_dns_zone_id is used to reference this private DNS zone when configuring DNS resolution for resources within the VPC. For example, you can associate an Amazon EC2 instance with a specific DNS name by creating a DNS record in the private DNS zone and specifying the private_dns_zone_id in the record configuration.

Private DNS zones in AWS can also be shared across multiple VPCs, or even across different AWS accounts, allowing for more efficient management of DNS resolution and reducing the need for manual updates to DNS records.

## sku_tier :

sku_tier refers to the tier or pricing level of a resource in Microsoft Azure.

In Azure, resources are organized into SKUs (Stock Keeping Units), which are standardized units of measure for resources such as virtual machines, storage accounts, and other services. The SKU determines the features and capabilities of the resource, as well as its pricing and billing model.

The sku_tier is a specific attribute of a SKU that defines the pricing tier or level of a resource. The available tiers may vary depending on the service, but generally include options such as Basic, Standard, and Premium, with each tier offering different levels of performance, features, and support.

For example, in Azure App Service, the sku_tier determines the features and capabilities of the web app, such as the amount of CPU, memory, and storage available, as well as support for features such as custom domains, SSL certificates, and scaling. The pricing for the app also varies depending on the selected sku_tier, with higher tiers offering more resources and capabilities at a higher cost.

When creating or updating a resource in Azure, you typically need to specify the SKU and sku_tier to determine the level of performance and features you require, as well as the cost associated with the resource.

## os_sku:
(Optional) Specifies the OS SKU used by the agent pool. Possible values include: Ubuntu, CBLMariner, Mariner, Windows2019, Windows2022. If not specified, the default is Ubuntu if OSType=Linux or Windows2019 if OSType=Windows. And the default Windows OSSKU will be changed to Windows2022 after Windows2019 is deprecated. Changing this forces a new resource to be created.
    - CBLMariner is a Linux distribution developed by Microsoft for internal use on its cloud infrastructure. It is designed to be a lightweight, minimalistic, and secure operating system that can run containers and other cloud-native applications.

    CBLMariner stands for "Cloud Base Linux Mariner". It is based on the Linux kernel and uses a custom package manager called "micropkg" for managing software packages. The distribution includes only the essential components needed to run containers, such as the container runtime and networking components.

    One of the key features of CBLMariner is its focus on security. The distribution is designed to be hardened by default, with security features such as signed package management, read-only root file system, and a minimal attack surface. It also supports secure boot and UEFI (Unified Extensible Firmware Interface) for booting.

    CBLMariner is open-source software, and the source code is available on GitHub. Although it was developed by Microsoft for internal use, it can be used by anyone who wants to run a minimalistic and secure Linux distribution in a containerized environment.

    It's worth noting that CBLMariner is not intended to be a general-purpose Linux distribution for desktop or server use. Instead, it is designed specifically for use in cloud infrastructure, where its minimalistic and secure design is well-suited to running containers and other cloud-native applications.

    - Mariner is a Linux distribution developed by Microsoft that is optimized for running cloud-native workloads on its Azure cloud platform. It is an open-source project and the code is available on GitHub.

Mariner is a lightweight and minimalistic distribution that includes only the essential components needed to run containerized workloads, such as the container runtime and networking components. It is designed to be secure and reliable, with features such as read-only root file system, signed package management, and minimal attack surface. It also supports secure boot and UEFI for booting.

One of the main benefits of using Mariner is its tight integration with the Azure cloud platform. It includes pre-configured settings and drivers that are optimized for running on Azure virtual machines and Azure Kubernetes Service (AKS). This can result in faster deployment times, better performance, and improved reliability for cloud-native applications running on Azure.

Mariner is based on the CentOS Linux distribution, which is itself based on the Red Hat Enterprise Linux (RHEL) distribution. However, Mariner is a separate distribution and is not affiliated with either CentOS or RHEL.

Overall, Mariner provides a streamlined and optimized Linux distribution that is well-suited to running cloud-native workloads on the Azure cloud platform. Its focus on security and reliability makes it a popular choice for enterprise customers who need to run mission-critical workloads in the cloud.

## os_disk_type:
    - (Optional) The type of disk which should be used for the Operating System. Possible values are Ephemeral and Managed. Defaults to Managed. Changing this forces a new resource to be created.
    - In this context, "Ephemeral" likely refers to an operating system disk that is created in memory and disappears when the VM is shut down or deleted. Ephemeral disks are typically used for temporary data or workloads that don't require persistent storage.

    "Managed" likely refers to an operating system disk that is backed by persistent storage, such as a virtual hard disk (VHD) or a managed disk. Managed disks are disks that are created and managed by the cloud service provider, rather than by the user. They offer features such as automatic backup and replication, and are typically used for workloads that require persistent storage.

    In some cloud computing environments, users may have the option to choose between ephemeral and managed disks for the operating system disk of their VMs. However, in the context of the statement, it is unclear which specific cloud service or platform is being referred to.

    The fact that the default value is set to "Managed" suggests that the statement may be related to a cloud service that uses managed disks as the default storage option for operating system disks.

    # Note: There is no os_type property in the azurerm_kubernetes_cluster resource in Terraform. Instead, the operating system type is determined by the node pool's os_disk_type property, which can be set to either "Ephemeral" or "Managed". For a Windows node pool, the os_disk_type should be set to "Ephemeral". For a Linux node pool, the os_disk_type should be set to "Managed"

